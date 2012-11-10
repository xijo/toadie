require 'toadie/version'
require 'toadie/todo'
require 'toadie/todolist'
require 'toadie/blame'
require 'toadie/formatter'
require 'toadie/runner'
require 'toadie/configuration'

require 'slim'
require 'fileutils'

module Toadie
  # Your code goes here...
end

Toadie.send :extend, Toadie::Configuration