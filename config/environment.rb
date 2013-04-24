WEBMATE_ROOT = File.expand_path('.')
require 'webmate'

Dir[File.join(WEBMATE_ROOT, 'app', 'routes', '**', '*.rb')].each do |file|
  require file
end
