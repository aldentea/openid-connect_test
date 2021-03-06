# This file contains your application, it requires dependencies and necessary
# parts of the application.
require 'rubygems'
require 'ramaze'

# Make sure that Ramaze knows where you are
Ramaze.options.roots = [__DIR__]

require_relative 'middleware_setup'

require_relative 'model/init'
require __DIR__('controller/init')
