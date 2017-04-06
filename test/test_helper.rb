require 'simplecov'
SimpleCov.start do
  add_filter "/test/"
end

require 'pry'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'Date'
