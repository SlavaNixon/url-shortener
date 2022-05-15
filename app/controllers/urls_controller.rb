class UrlsController < ApplicationController
  # Show form url create
  def new
  end

  # Statistics
  def stats
    @url = Url.find_by(small_url: params[:small_url])
  end

  # Show current url info
  def show
    url = Url.find_by(small_url: params[:small_url])
    url.update(stats: url.stats + 1)
    redirect_to url.full_url, allow_other_host: true
  end

  # Create new url in DB
  def create
    full_url = params[:full_url]

    unless Url.find_by(full_url: parse_url(full_url))
      url_create = Url.create(full_url: full_url, small_url: create_small_url)
      
      if url_create.save
        flash[:url_m] = url_url(url_create)
        flash[:stats] = stats_url_path(url_create)
      else
        flash[:error_m] = "Что-то пошло не так, ссылка не создана("
      end
    else
      flash[:info_m] = "Данная ссылка уже была создана(возможно в далёком-далёком прошлом и даже не Вами)"
      flash[:url_m] = url_url(Url.find_by(full_url: parse_url(full_url)))
    end
    redirect_to root_url
  end

  private

  def create_small_url
    if Url.last
      Crc32.calculate(Url.last.id.to_s(16), Url.last.id.to_s(16).length, 0).to_s(16)
    else
      Crc32.calculate("0", 1, 0).to_s(16)
    end
  end

  def parse_url(url)
    parsed_url = Domainatrix.parse(url).url
    parsed_url = "#{parsed_url}/" unless parsed_url.last == "/"
    parsed_url
  end
end
