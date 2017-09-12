Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :companies, only: [:index]
      get "/companies/alphabetically" => "companies#alphabetically"
      get "/companies/with_modern_plan" => "companies#with_modern_plan"
      get "/companies/not_trialing" => "companies#not_trialing"
      get "/companies/created_last_month" => "companies#created_last_month"
    end
  end
end