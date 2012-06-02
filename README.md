# Under::Pressure

A simple gem to compress images.

Uses:

* pngcrush
* jpegoptim

## Installation

Add this line to your application's Gemfile:

    gem 'under-pressure'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install under-pressure

## Usage

```ruby
UnderPressure::Compressor.compress(in_path, out_path)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
