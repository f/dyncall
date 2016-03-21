# DynCall

Dynamic method calling support for Crystal Language. Created to be used with [Kreal on Kemal](http://github.com/f/kreal).

## Installation


Add this to your application's `shard.yml`:

```yaml
dependencies:
  dyncall:
    github: f/dyncall
```

## Usage

```crystal
require "dyncall"

class User
  # Use `share` macro to share methods.
  share :name, :surname

  # Shared methods has to have just one parameter as hash.
  def self.name(args)
    "Hi #{args[:name]}!"
  end

  def self.surname(args)
    "Hello, Mr. #{args[:surname]}"
  end
end
```

### Simple API

```crystal
# Getting Shared Methods
User.shared # => [:name, :surname]

# Checking if method is shared
User.shared? :name # => true

# Calling shared method
User.call :name, {name: "Fatih"} # => "Hi Fatih!"
User.call :surname, {surname: "Fatih"} # => "Hello, Mr. Fatih"
```

## Contributing

1. Fork it ( https://github.com/f/dyncall/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [f](https://github.com/f) Fatih Kadir Akın - creator, maintainer
