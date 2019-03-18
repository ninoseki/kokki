# kokki

[![Build Status](https://travis-ci.org/ninoseki/kokki.svg?branch=master)](https://travis-ci.org/ninoseki/kokki)
[![Coverage Status](https://coveralls.io/repos/github/ninoseki/kokki/badge.svg?branch=master)](https://coveralls.io/github/ninoseki/kokki?branch=master)

A Ruby gem for converting a country name / code & IP address to an emoji flag.

## Install

```bash
gem install kokki
```

## Usage

```ruby
require "kokki"

puts "JP: #{Kokki.flagize('JP')}"
# => JP: 🇯🇵
puts "JPN: #{Kokki.flagize('JPN')}"
# => JPN: 🇯🇵
puts "Japan: #{Kokki.flagize('Japan')}"
# => Japan: 🇯🇵
puts "202.214.194.147: #{Kokki.flagize('202.214.194.147')}"
# => 202.214.194.147: 🇯🇵

begin
  Kokki.flagize("test")
rescue Kokki::InvalidInputError => e
  puts e.message
  # => invalid input: test
end
```
