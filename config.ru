require 'rubygems'
require 'bundler'

Bundler.require
Dotenv.load

require 'tilt/erb'
require './app'

run App
