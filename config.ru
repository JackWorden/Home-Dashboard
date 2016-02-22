require 'rubygems'
require 'bundler'
require 'sass/plugin/rack'
require 'json'

Bundler.require

Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack

Dir["#{File.dirname(__FILE__)}/lib/**/*.rb"].each { |f| load(f) }

require './dashboard'
run Dashboard