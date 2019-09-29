# kokki

[![Gem Version](https://badge.fury.io/rb/kokki.svg)](https://badge.fury.io/rb/kokki)
[![Build Status](https://travis-ci.org/ninoseki/kokki.svg?branch=master)](https://travis-ci.org/ninoseki/kokki)
[![Coverage Status](https://coveralls.io/repos/github/ninoseki/kokki/badge.svg?branch=master)](https://coveralls.io/github/ninoseki/kokki?branch=master)
[![CodeFactor](https://www.codefactor.io/repository/github/ninoseki/kokki/badge)](https://www.codefactor.io/repository/github/ninoseki/kokki)

A Ruby gem for converting a country name / code & IP address to an emoji flag.

## Install

```bash
gem install kokki
# or
docker pull ninoseki/kokki
```

## Usage

### As a CLI

```bash
$ kokki TW
🇹🇼
$ kokki USA
🇺🇸
$ kokki japan
🇯🇵
$ kokki 202.214.194.147
🇯🇵
# it suports a defanged ip as an input
$ kokki 1.1.1[.]1
🇦🇺
$ kokki "1.1.1(.)1"
🇦🇺

# or
$ docker run --rm ninoseki/kokki Japan
🇯🇵
```

### As a library

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
