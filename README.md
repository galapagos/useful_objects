# UsefulObjects

This gem making it possible to expand the instance using a function of refinement locally.  
Because that expand the function locally, keepable influence a minimum for a change.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'useful_objects'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install useful_objects

## Extend objects

### ObjectClass

* __to_bool__ Cast all object to boolean type.

* __conditional_method__ By the return value of the block which gave, this change the behavior of the method. 

```rb
using ObjectExtender

char = 'a'
char.upcase # => 'A'

# when block returns false, that the method dose not work.
char.conditional_method(:upcase) { |_object| false }
char.upcase # => nil
```

### DateClass

* __step_by_unit__ Returns enumerator that step by given unit(year, month, week, day).

### StringClass

* __parse_json__ Parse json string, if not parsed string, return nil.
* __parse_json!__ Parse json string, if not parsed string, raise JSON::ParserError.

## Development

After checking out the repo, run `bin/setup` to install dependencies.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/useful_objects. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

