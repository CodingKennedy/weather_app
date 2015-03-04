$:.unshift File.expand_path("../", __FILE__)
require 'rubygems'
require 'sinatra'
require './web'
require 'yahoo_weatherman'
run Sinatra::Application
