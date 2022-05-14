class Url < ApplicationRecord
  before_validation :parse_url

  validates :full_url, format: { with: /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix }
  def to_param
    small_url
  end

  private

  def parse_url
    self.full_url = Domainatrix.parse(self.full_url).url
    self.full_url = "#{self.full_url}/" unless self.full_url.last == "/"
  end
end
