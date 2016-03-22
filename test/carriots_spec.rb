require 'test_helper'

describe Carriots do
  before do
    Carriots.reset!
  end

  after do
    Carriots.reset!
  end

  it 'has_a_version_number' do
    refute_nil ::Carriots::VERSION
  end

  it 'sets defaults' do
    Carriots::Configurable.keys.each do |key|
      Carriots.instance_variable_get(:"@#{key}").must_equal(Carriots::Default.send(key))
    end
  end

  describe '.client' do
    it 'creates an Carriots::Client' do
      Carriots.client.must_be_kind_of Carriots::Client
    end
    it 'caches the client when the same options are passed' do
      Carriots.client.must_equal(Carriots.client)
    end
    it 'returns a fresh client when options are not the same' do
      client = Carriots.client
      Carriots.write_api_key = 'YOUR_WRITE_KEY'
      client_two = Carriots.client
      client_three = Carriots.client

      client.wont_equal(client_two)
      client_three.must_equal(client_two)
    end
  end

  describe '.configure' do
    Carriots::Configurable.keys.each do |key|
      it "sets the #{key.to_s.tr('_', ' ')}" do
        Carriots.configure do |config|
          config.send("#{key}=", key)
        end
        Carriots.instance_variable_get(:"@#{key}").must_equal(key)
      end
    end
  end
end
