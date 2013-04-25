require 'helper'

describe Yammer do

  after do
    Yammer.reset
  end

  describe '.respond_to?' do
    it "delegates to Yammer::Client" do
      Yammer.respond_to?(:new).should be_true
    end
    it "takes an optional argument" do
      Yammer.respond_to?(:new, true).should be_true
    end
  end

  describe ".new" do
    it "returns a Yammer::Client" do
      Yammer.new.should be_a Yammer::Client
    end
  end

  describe ".credentials?" do
    it "returns true if all credentials are present" do
      Yammer.configure do |config|
        config.oauth_token = 'OT'
      end
      Yammer.credentials?.should be_true
    end
    it "returns false if any credentials are missing" do
      Yammer.configure do |config|
        config.oauth_token = nil
      end
      Yammer.credentials?.should be_false
    end
  end

end
