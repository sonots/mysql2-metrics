# Mysql2::Metrics

Instrument mysql2 queries.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mysql2-metrics'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mysql2-metrics

## Usage

Just require `mysql2/metrics` in addition to `mysql2`, ans use mysql2 as usual. 

```ruby
require 'mysql2'
require 'mysql2-metrics'

client = Mysql2::Client.new(:host => "localhost", :username => "root", :database => "test")
results = client.query("CREATE TABLE IF NOT EXISTS test (id INT)")
```

This will output a measured time to STDOUT as:

```
time:2014-11-02T01:38:25+09:00  query:CREATE TABLE IF NOT EXISTS test (id INT)  elapsed:0.000299591
```

where `elapsed` is the elapsed time in second. 

## ToDo

* write tests
* output to a file path

## Contributing

1. Fork it ( https://github.com/sonots/mysql2-metrics/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
