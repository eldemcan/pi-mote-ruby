# Pi Mote ruby
Energenie [Pi-mote](https://energenie4u.co.uk/catalogue/product/ENER002-2PI) ruby api for Raspberry Pi.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pi_mote'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pi_mote

# Dependency

You need to install [rpi gpio](https://github.com/ClockVapor/rpi_gpio) library.
If you encounter problems related with permissions you can change ownership of `/dev/gpiomem` folder with `sudo chown root.gpio /dev/gpiomem
sudo chmod g+rw /dev/gpiomem` chmod one will give write permissions.

# Usage

```ruby
sc = PiMote::Sockets.new
sc.switch_on(socket_number)
sc.switch_off(socket_number)

sc.switch_on # all sockets on
sc.switch_off # all sockets on
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/pi_mote. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PiMote project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/celdem/pi_mote/blob/master/CODE_OF_CONDUCT.md).
