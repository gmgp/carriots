# Carriots

This is a tiny API wrapper of [Carriots](http://www.carriots.com) services

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'carriots'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install carriots

## Usage

API methods are available as module methods (consuming module-level configuration) or as client instance methods.

```ruby
# Provide authentication credentials
Carriots.configure do |c|
  c.login = 'giovanni'
  c.write_api_key = 'your_very_very_very_very_very_very_long_key'
end

# Fetch the current streams
Carriots.streams
```
or

```ruby
# Provide authentication credentials
client = Carriots::Client.new(login: 'giovanni', write_api_key: 'YOUR_API_KEY')

# Fetch the current streams
client.streams

```

or if you have ENV['CARRIOTS_WRITE_API_KEY'] and ENV['CARRIOTS_LOGIN']


### Default client value

You can override default and options value using ENV variable

```ruby
  ENV['CARRIOTS_API_ENDPOINT']       || API_ENDPOINT
  ENV['CARRIOTS_DEFAULT_MEDIA_TYPE'] || MEDIA_TYPE
  ENV['CARRIOTS_USER_AGENT']         || USER_AGENT
  ENV['CARRIOTS_WEB_ENDPOINT']       || WEB_ENDPOINT

  ENV['CARRIOTS_WRITE_API_KEY']
  ENV['CARRIOTS_LOGIN']
```

## Error Handling

In the folder 'lib/carriots/errors' were defined some errors, for now it raise a 'ConnectionError' when something went wrong with the GET call to api comunicating the status and the reason phrase.



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### TODO

* add better test coverage to Options
* add others API call over streams/
* ....

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gmgp/carriots. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

