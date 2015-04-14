# Mosfet

A ruby class you can use to display datetime values and datetime ranges just like Google Calendar does. For example:

* Fri, February 2, 12am
* Fri, February 2, 12:01am
* Fri, February 2, 12am — 1am
* Sat, February 2, 2002, 12am — Sun, February 3, 2002, 1am

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mosfet'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mosfet

## Usage

Mosfet::TimeDisplay.new(DateTime.new(2002, 2, 2, 0, 0, 0)).to_s #=> 'Sat, February 2, 2002, 12am'

## MOSFET?

I name all my gems after electronics components. A MOSFET (metal oxide semiconductor field-efect transistor) is a very common type of transisistor, especially audio amplifiers. You probably have a device or two sitting on your desk that has some.


## Contributing

1. Fork it ( https://github.com/[my-github-username]/mosfet/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
