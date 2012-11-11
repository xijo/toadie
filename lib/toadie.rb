require 'toadie/version'
require 'toadie/todo'
require 'toadie/todolist'
require 'toadie/blame'
require 'toadie/author'
require 'toadie/report'
require 'toadie/run'
require 'toadie/configuration'
require 'toadie/errors'
require 'toadie/fake_results'

require 'slim'
require 'fileutils'

module Toadie
end

Toadie.send :extend, Toadie::Configuration
