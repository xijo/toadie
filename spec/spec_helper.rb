require 'simplecov'

SimpleCov.adapters.define 'gem' do
  add_filter '/spec/'
  add_filter '/autotest/'
  add_group 'Libraries', '/lib/'
end
SimpleCov.start 'gem'

require 'toadie'
Toadie.test = true

RSpec.configure do |config|
  config.color_enabled = true
  config.mock_with :rspec

  config.after(:each) { Toadie::Author.destroy_all }
end
