Webmate::Application.define_routes do
  get '/', to: 'pages#index', transport: [:http]
  resources :users
end
