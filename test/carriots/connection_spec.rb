describe 'connection_to_api' do
  it 'give back a ConnectionError when invalid api key was setted' do
    VCR.use_cassette('invalid_api_key') do
      read = 'INVALID_API_KEY'
      client = Carriots::Client.new(login: 'giovanni', write_api_key: read)
      
      assert_raises Carriots::Errors::ConnectionError do
        client.streams
      end
    end
  end
end