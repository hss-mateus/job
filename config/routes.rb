Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users, skip: :registrations

  constraints subdomain: "" do
    devise_for :users, only: :registrations

    resource :company, only: [:new, :create]

    namespace :candidate do
      resource :resume
      resources :job_postings do
        post :apply
      end
      resources :job_applications
    end
  end

  constraints subdomain: /.+/ do
    namespace :company do
      resources :resumes
      resources :job_postings
      resources :job_applications
    end

    namespace :admin do
      resource :company
      resource :subscription
      resource :employees
    end
  end
end
