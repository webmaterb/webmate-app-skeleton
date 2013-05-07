require './config/environment'
if configatron.assets.compile
  map '/assets' do
    run Webmate::Sprockets.environment
  end
end
run ExampleApp
