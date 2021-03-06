# Hazure

[![Build Status](https://img.shields.io/travis/holidayworking/hazure/master.svg)](https://travis-ci.org/holidayworking/hazure)
[![Code Climate](https://img.shields.io/codeclimate/github/holidayworking/hazure.svg)](https://codeclimate.com/github/holidayworking/hazure)

Outlier Detection with One-class SVM

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hazure'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hazure

## Usage

```ruby
detector = Hazure::Detector.new([[1,0,0], [1,0,0]])

detector.outlier?([1, 0, 0])
# => false

detector.outlier?([10, 0, 0])
# => true
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/holidayworking/hazure/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
