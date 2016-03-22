require 'test_helper'

describe Carriots::Client do
  before do
    Carriots.reset!
  end

  after do
    Carriots.reset!
  end

  describe 'module configuration' do
    before do
      Carriots.reset!
      Carriots.configure do |config|
        Carriots::Configurable.keys.each do |key|
          config.send("#{key}=", "Some #{key}")
        end
      end
    end

    after do
      Carriots.reset!
    end

    it 'inherits the module configuration' do
      client = Carriots::Client.new
      Carriots::Configurable.keys.each do |key|
        client.instance_variable_get(:"@#{key}").must_equal("Some #{key}")
      end
    end

    describe 'with class level configuration' do
      before do
        @opts = {
          connection_options: { ssl: { verify: false } },
          write_api_key: 'il0veruby',
          login: 'giovanni'
        }
      end

      it 'overrides module configuration' do
        client = Carriots::Client.new(@opts)

        client.instance_variable_get(:"@write_api_key").must_equal('il0veruby')
      end

      it 'can set configuration after initialization' do
        client = Carriots::Client.new
        client.configure do |config|
          @opts.each do |key, value|
            config.send("#{key}=", value)
          end
        end
        client.instance_variable_get(:"@write_api_key").must_equal('il0veruby')
        client.login.must_equal('giovanni')
      end

      it 'masks write_api_key on inspect' do
        client = Carriots::Client.new(@opts)
        inspected = client.inspect
        inspected.wont_include('il0veruby')
      end

      it 'masks tokens on inspect' do
        client = Carriots::Client.new(write_api_key: 'qwertyuiopasdfghjklzxcvbnm123456789d7ba8')
        inspected = client.inspect
        inspected.wont_include('qwertyuiopasdfghjklzxcvbnm123456789d7ba8')
        inspected.must_include('***********************************d7ba8')
      end
    end
  end
end
