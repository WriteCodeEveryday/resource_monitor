# ResourceMonitor

This is a simple rails resource monitoring gem.

Requires ActionCable and Rails 5.0+, and is optimized to run under Linux / Mac servers.

Creates a simple page under /resources/ that is updated with CPU/RAM usage in realtime.

Although not a major performance hog, this should only be run in production when there is evidence of resource overuse, look under the Usage section for instructions for disabling the gem.

Current Project Status: Initial Commit (Not Viable For Any Project)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'resource_monitor'
```

And then execute:

    $ bundle install

And then add the following to the top of your application.rb file
You can also only add it to the controllers you think may be causing some issues.

```ruby
before_action :resource_monitor_app
after_action :resource_monitor_app

def resource_monitor_app
  ResourceMonitor.benchmark(self)
end
```

## Usage

Install, deploy and browse to /resources/.

If you want to disable this, you can easily comment out the contents of resource_monitor_app or use an ENV variable such as below.

```ruby
before_action :resource_monitor_app
after_action :resource_monitor_app

def resource_monitor_app
  if ENV['MONITORING_ENABLED']
    ResourceMonitor.benchmark(self)
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `rake console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/WriteCodeEveryday/resource_monitor.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
