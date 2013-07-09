Webmate::Application.configure do |config|
  # add directory to application load paths
  # config.app.load_paths << ["app/uploaders"]
  config.app.cache_classes = true
  config.assets.compile = false

  config.websockets.namespace = 'api'
  config.websockets.enabled = true
  config.websockets.port = 9020
end

Webmate::Application.configure(:development) do |config|
  config.app.cache_classes = false
  config.assets.compile = true
  config.websockets.port = 3503
end
