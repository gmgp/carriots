describe 'stream_api_call' do
  it 'give back a hashed body' do
    VCR.use_cassette('all_strams') do
      read = 'YOUR_WRITE_API_KEY'
      client = Carriots::Client.new(login: 'giovanni', write_api_key: read)
      stream = client.streams

      assert_equal Hash, stream.body.class
    end
  end
end
