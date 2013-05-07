# Webmate Application Skeleton


## Quick start

1. to start application, run

    webmate start
application will be available on localhost:3000 url

2. to run irb/console

    webmate console

3. type webmate without params to know all options

4. show all available routes [ without assets ]

    rake routes

## Tutorial
### Skeleton

to create file, add following gem to Gemfile

    gem 'webmate'
    gem 'slim'
    gem 'sass', group: assets
    gem 'rake'
    gem 'alphasights-sinatra-sprockets', require: 'sinatra-sprockets', group: assets

base required files:

config.ru

    require './config/environment'
    if configatron.assets.compile
      map '/assets' do
        run Sinatra::Sprockets.environment
      end
    end
    run ExampleApp

config/config.rb

    Webmate::Application.configure do |config|
      # add directory to application load paths
      #config.app.load_paths << ["app/uploaders"]
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

config/application.rb

    require 'digest/sha1'
    require 'base64'

    class ExampleApp < Webmate::Application
      # do other things)
    end

config/environment.rb

    WEBMATE_ROOT = File.expand_path('.')
    require 'webmate'

    Dir[File.join(WEBMATE_ROOT, 'app', 'routes', '**', '*.rb')].each do |file|
      require file
    end

### Hello world

1. adding route
app/routes/facade_routes.rb

      ExampleApp.define_routes do
        get '/', to: 'pages#index', transport: [:http]
      end

2. adding  responder to this route
create files in app/responders

    base_responder
      class BaseResponder < Webmate::Responders::Base
        # Available options
        # before_filter :do_something

        rescue_from Webmate::Responders::ActionNotFound do
          render_not_found
        end
      end

    pages_responder
      class PagesResponder < BaseResponder
        include Webmate::Responders::Templates

        def index
          slim :index, layout: 'application'
        end
      end

    also, required files
      app/views/layouts/application.html.slim
      app/views/pages/index.html.slim

  ### Assets
  assets will be searched in app/assets folder, so place them to
    app/assets/javascripts
    app/assets/stylesheets

  ### Utilities - rake task, scripts
  Rakefile
    require File.expand_path('../config/environment', __FILE__)
    Webmate::Application.load_tasks


## Models and connection to Mongo
### Mongo
config/mongoid.yml # default mongoid config file
and add following file
  config/initializers/mongoid.rb

      Mongoid.load!(File.join(WEBMATE_ROOT, 'config', 'mongoid.yml'))

### Models
add them to app/models

    app/models/project.rb, for example

      class Project
        include Mongoid::Document

        field :name
        field :description
        field :status
      end
