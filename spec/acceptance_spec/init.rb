ENV['RACK_ENV'] = 'test'

Dir.glob('./{config,controllers,forms,lib,views}/init.rb').each do |file|
  require file
end

require 'minitest/autorun'
require 'rack/test'
require 'watir-webdriver'
require 'headless'
require 'page-object'

include Rack::Test::Methods

def app
  FoodyCallApp
end
