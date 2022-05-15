Rails.application.routes.draw do
  root to: "urls#new"

  resources :urls, param: :small_url, only: %i[new show create] do
    get 'stats', on: :member
  end
end
