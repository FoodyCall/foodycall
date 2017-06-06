ENV['RACK_ENV'] = 'test'

Dir.glob('./{config,controllers,views,models,services}/init.rb').each do |file|
  require file
end
require 'minitest/autorun'
require 'rack/test'

include Rack::Test::Methods

def app
  FoodyCallApp
end
