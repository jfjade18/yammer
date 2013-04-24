unless ENV['CI']
  require 'simplecov'
  SimpleCov.start do
    add_filter 'spec'
  end
end

require 'yammer'
require 'rspec'
require 'stringio'
require 'tempfile'
require 'timecop'
require 'webmock/rspec'

def a_delete(path)
  a_request(:delete, 'https://www.yammer.com/api/v1/' + path)
end

def a_get(path)
  a_request(:get, 'https://www.yammer.com/api/v1/' + path)
end

def a_post(path)
  a_request(:post, 'https://www.yammer.com/api/v1/' + path)
end

def a_put(path)
  a_request(:put, 'https://www.yammer.com/api/v1/' + path)
end

def stub_delete(path)
  stub_request(:delete, 'https://www.yammer.com/api/v1/' + path)
end

def stub_get(path)
  stub_request(:get, 'https://www.yammer.com/api/v1/' + path)
end

def stub_post(path)
  stub_request(:post, 'https://www.yammer.com/api/v1/' + path)
end

def stub_put(path)
  stub_request(:put, 'https://www.yammer.com/api/v1/' + path)
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end
