# Alisms

This gem is for [aliyun sms service](https://market.aliyun.com/products/57002003/cmapi011900.html?spm=5176.730005-57002003.468004.2.pKQMdW).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'alisms'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install alisms

## Usage

### Without Rails
```ruby
Alisms.appcode = 'YOUR APP CODE'
Alisms::Client.send_sms(param_string).to(rec_num).with_template(template_code).by(sign_name)
```

### Within Rails

```terminal
$ touch config/initialize/alisms.rb

```

```ruby
Alisms.configure do |config|
  config.appcode = 'YOUR APP CODE'
end

```
Then, you could 
```ruby
Alisms::Client.send_sms(param_string).to(rec_num).with_template(template_code).by(sign_name)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rocLv/alisms. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Alisms project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/rocLv/alisms/blob/master/CODE_OF_CONDUCT.md).
