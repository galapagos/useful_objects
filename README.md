# UsefulObjects

[![Build Status](https://travis-ci.org/galapagos/useful_objects.svg?branch=master)](https://travis-ci.org/galapagos/useful_objects)

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

```rb
using UsefulObjects::ObjectExtender

# cast to false cases.
'false'.to_bool # => false
0.to_bool       # => false
0.0.to_bool     # => false
nil.to_bool     # => false
false.to_bool   # => false

# other case all true.
''.to_bool         # => true
true.to_bool       # => true
Object.new.to_bool # => true
```

* __conditional_method__ By the return value of the block which gave, this change the behavior of the method.

```rb
using UsefulObjects::ObjectExtender

char = 'a'
char.upcase # => 'A'

# when block returns false, that the method dose not work.
char.conditional_method(:upcase) { |_object| false }
char.upcase # => nil
```

### DateClass

* __step_by_unit__ Returns enumerator that step by given unit(year, month, week, day).

```rb
using UsefulObjects::DateExtender

from = Date.new 2000, 1, 1

from.step_by_unit(Date.new(2000, 1, 3)).each_with_object('%Y-%m-%d').map(&:strftime)
# => '2000-01-01'
# => '2000-01-02'
# => '2000-01-03'

from.step_by_unit(Date.new(2000, 3, 1), unit: :month).each_with_object('%Y-%m-%d').map(&:strftime)
# => '2000-01-01'
# => '2000-02-01'
# => '2000-03-01'

from.step_by_unit(Date.new(2002, 1, 1), unit: :year).each_with_object('%Y-%m-%d').map(&:strftime)
# => '2000-01-01'
# => '2001-01-01'
# => '2002-01-01'

from.step_by_unit(Date.new(2000, 1, 15), unit: :week).each_with_object('%Y-%m-%d').map(&:strftime)
# => '2000-01-01'
# => '2000-01-08'
# => '2000-01-15'
```

### TimeClass

* __millisec__ Get millisec.

```rb
using UsefulObjects::TimeExtender

time = Time.at(946652400.001) # 2000-01-01 00:00:00.001
time.millisec # => 1
```

* __to_time__ Cast integer or float to time.

```rb
using UsefulObjects::TimeExtender

946652400.to_time # => 2000-01-01 00:00:00 +0900
946652400.001.to_time # => 2000-01-01 00:00:00 +0900
```

### StringClass

* __parse_json__ Parse json string, if not parsed string, return nil.

```rb
using UsefulObjects::StringExtender

'aaa'.parse_json # => nil
'{ "a": "a" }'.parse_json # => { "a" => "a" }
```

### Iterator(Array, Enumerator)

* __map_with_object__ Alias for `iterator.each_with_object(assign_val).map(&:proc)`.

```rb
%w(a b c).map_with_object(:*, 3) => ['aaa', 'bbb', 'ccc']
%w(a b c).map_with_object(3) { |item, num| item * num } => ['aaa', 'bbb', 'ccc']
```

## Development

After checking out the repo, run `bin/setup` to install dependencies.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/useful_objects. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

