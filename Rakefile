#!/usr/bin/env rake
require "bundler/gem_tasks"

namespace :assets do
  desc "Compiles all assets"
  task :compile do
    puts "Compiling assets"
    require 'sprockets'
    assets = Sprockets::Environment.new
    assets.append_path 'assets/javascripts'
    assets.append_path 'assets/stylesheets'
    assets['application.js'].write_to('public/application.js')
    assets['application.css'].write_to('public/application.css')
  end
end

desc "Open an irb session preloaded with this library"
task :console do
  sh "irb -rubygems -I lib -r toadie.rb"
end