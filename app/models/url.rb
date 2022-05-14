class Url < ApplicationRecord
  def to_param
    small_url
  end
end
