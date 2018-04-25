# PbSyringe

Supports Dependency Injection about Progressbar.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pb_syringe'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pb_syringe

## Usage

1. Include PbSyringe::Progressable to your object.
    ```
    require "pb_syringe"

    class SampleClass
        include PbSyringe::Progressable

    end
    ```
    `PbSyringe::Progressable` implements `progress_start`, `progress_increment`, `progress_finish` methods that you can call when you want progressbar expression.

2. Implements concrete PbSyringe::ProgressUnit class that behaves Progressbar you want.
    ```
    class AwesomeProgressBar < PbSyringe::ProgressUnit
        def start(**options)
            # TODO: init progressbar
            # called when you call progress_start of Progressable object method.
        end

        def progress_increment(count)
            # TODO: adjust progressbar's progress
            # called when progress_increment called.
        end

        def progress_finish
            # TODO: finish progress bar
            # called when progress_finish called.
        end
    end
    ```

3. assign ProgressUnit to Progressable Object (Dependency Injection)
    ```
    sample = SampleClass.new
    unit = AwesomeProgressBar.new

    ### PbSyringe provides `PbSyringe::AnsiProgressbarUnit` using `ANSI::Progressbar`, might be useful for rake task.
    ### And it is a sample implementation of ProgressUnit.
    ### If you want to try, check below.
    ### require "pb_syringe/ansi_progressbar_unit"
    ### unit = PbSyringe::AnsiProgressbarUnit.new

    sample.progress_unit = unit

    sample.progress_start(label: "test", total: 100)

    100.times do |i|
        sample.progress_increment(i + 1)
    end

    sample.progress_finish

    # block style calls finish after yield block
    sample.progress_start(label: "test", total: 100) do
        100.times do |i|
            sample.progress_increment(i + 1)
        end
    end
    ```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yiyenene/pb_syringe. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PbSyringe project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/yiyenene/pb_syringe/blob/master/CODE_OF_CONDUCT.md).
