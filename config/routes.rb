Rails.application.routes.draw do
  # User management
  devise_for :user, :controllers => { :registrations => 'registrations' }

  # Admin controller
  get 'admin/presentations', to: 'admin#index'
  get 'admin/presentations/create', to: 'admin#create'
  get 'admin/presentations/:id', to: 'admin#details'

  put 'admin/presentations/:id', to: 'admin#update_presentation'

  post 'admin/presentations/create', to: 'admin#make_event'
  post 'admin/presentations/:id/feedback', to: 'admin#feedback'
  delete 'admin/presentations/:id', to: 'admin#delete_presentation'
  delete 'admin/presentations/:id/feedback', to: 'admin#delete_feedback'

  # Presentations controller
  get 'presentations', to: 'presentations#index'
  get 'presentations/:id', to: 'presentations#details'
  
  post 'presentations/:id/feedback', to: 'presentations#feedback'
  delete 'presentations/:id', to: 'presentations#delete_presentation'
  delete 'presentations/:id/feedback', to: 'presentations#delete_feedback'

  # Root route
  root 'presentations#index'
end
