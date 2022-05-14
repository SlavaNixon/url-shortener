class UrlsController < ApplicationController
  # Show form url create
  def new
  end

  # Show current url info
  def show
    redirect_to Url.find_by(small_url: params[:small_url]).full_url, allow_other_host: true
  end

  # Create new url in DB
  def create
    full_url = params[:full_url]

    unless Url.find_by(full_url: full_url)
      url_create = Url.create(full_url: full_url, small_url: create_small_url)
      flash[:url_m] = url_url(url_create)
      redirect_to root_url
    end
  end

  private

  def create_small_url
    if Url.last
      Crc32.calculate(Url.last.id.to_s(16), Url.last.id.to_s(16).length, 0).to_s(16)
    else
      Crc32.calculate("0", 1, 0).to_s(16)
    end
  end
end
