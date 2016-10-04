SimpleCov.start do
  add_filter '/bin/'
  add_filter '/spec/'
end
require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start
