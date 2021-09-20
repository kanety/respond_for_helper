require 'simplecov'
SimpleCov.start do
  add_filter "/spec/"
end

require 'rails_helper'

def debug(message)
  puts message if ENV['DEBUG'] == '1'
end
