# Waldo

Waldo is a repo meant to show you the process of making your own Ruby gem

# Process

## Generate the gem

`bundle gem waldo`

## Edit the gemspec file

```
# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'waldo/version'

Gem::Specification.new do |spec|
  spec.name          = "waldo"
  spec.version       = Waldo::VERSION
  spec.authors       = ["Austin Trout"]
  spec.email         = ["trouta23@gmail.com"]

  spec.summary       = %q{Waldo is used to learn about making your own gem}
  spec.homepage      = "https://github.com/trouta23/waldo"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
```

## Update the .gitignore file

```
/.bundle/
/.yardoc
/Gemfile.lock
/_yardoc/
/coverage/
/doc/
/pkg/
/spec/reports/
/tmp/
*.gem
```

## Add your code

## Deploy to GitHub

## Bundle Local Gemfile

`bundle install`

## Generate and Deploy to RubyGems.org

`bundle exec rake release`

---

# What you'll initially see when you initially make your gem

---

# Waldo

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/waldo`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'waldo'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install waldo

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/waldo. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
