# Waldo

Waldo is a repo meant to show you the process of making your own Ruby gem. In this scenario we're making
the gem called waldo. When you go about making your own, your name will have to be unique, and you'll need
to swap out the information that is unique to yourself and your gem. Overall I wanted to be as transparent
as I could about the process to show that it's not something to stress about and to give it a try!

# Make GitHub and RubyGems account

If you haven't done so already, this would be a great time to make yourself a GitHub account
and a RubyGems.org account. These will be used later in the tutorial.

# Process

## Install bundler

This step is optional if you already have it, but will be required for this tutorial.

    $ gem install bundler

## Generate the gem

```
$ bundle gem waldo

Creating gem 'waldo'...
MIT License enabled in config
Code of conduct enabled in config
      create  waldo/Gemfile
      create  waldo/.gitignore
      create  waldo/lib/waldo.rb
      create  waldo/lib/waldo/version.rb
      create  waldo/waldo.gemspec
      create  waldo/Rakefile
      create  waldo/README.md
      create  waldo/bin/console
      create  waldo/bin/setup
      create  waldo/LICENSE.txt
      create  waldo/CODE_OF_CONDUCT.md
Initializing git repo in /waldo
```

## Edit the gemspec file

Modify the gemspec to your specifications

```
# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'waldo/version'

Gem::Specification.new do |spec|
  spec.name          = "waldo"
  spec.version       = Waldo::VERSION
  spec.authors       = ["Austin Trout"]
  spec.email         = ["[trouta23@gmail.com]"]

  spec.summary       = %q{Waldo is used to learn about making your own gem}
  spec.homepage      = "https://github.com/trouta23/waldo"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0.2"
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

For example, in `lib/waldo.rb`:

```ruby
require "waldo/version"

module Waldo
  def self.where_are_you
    puts "It's a secret!"
  end
end
```

## Deploy to GitHub

Create a new repo, and follow the steps to push to the new GitHub repo.

The exact steps to do so are not in this tutorial.

This is what you'll see initially:

---

# Waldo

Welcome! This gem is meant to act as a introduction on how to make your own gem from scratch. In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/waldo`. To experiment with that code, run `bin/console` for an interactive prompt.

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

- Open up a console: `bin/console`
- Call `Waldo.where_are_you`
- You should expect to see: `It's a secret!` returned

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/waldo. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

---

# Testing out your new gem

## Build your gem

```
$ gem build waldo.gemspec

Successfully built RubyGem
Name: waldo
Version: 0.1.0
File: waldo-0.1.0.gem
```

## Install your gem

You'll want to base it off your File name seen in the gemspec

```
$ gem install ./waldo-0.1.0.gem

Successfully installed waldo-0.1.0
Parsing documentation for waldo-0.1.0
Installing ri documentation for waldo-0.1.0
Done installing documentation for waldo after 0 seconds
1 gem installed
```

## Test it in irb

```
$ irb

>> require 'waldo'
=> true
>> Waldo.where_are_you
It's a secret!
```

# Cutting a release

## Setup RubyGems API access

On your RubyGems profile, go to the edit view and down under the API ACCESS section you'll see a version of the command below:

    $ curl -u {username} https://rubygems.org/api/v1/api_key.yaml > ~/.gem/credentials; chmod 0600 ~/.gem/credentials

Run this command as this will give you access to gem commands from the command line.
Located here: http://guides.rubygems.org/command-reference/

When you run this command you'll get prompted for your key which will also be located under API ACCESS and say:

`Your API key is {your_key_here}.`

## Bundle local gemfile

```
$ bundle install

Fetching gem metadata from https://rubygems.org/
Fetching version metadata from https://rubygems.org/
Resolving dependencies...
Installing rake 10.5.0
Using bundler 2.0.2
Using waldo 0.1.0 from source at `.`
Bundle complete! 3 Gemfile dependencies, 3 gems now installed.
Use `bundle show [gemname]` to see where a bundled gem is installed.
```

## Generate and deploy to RubyGems.org

```
$ bundle exec rake release

waldo 0.1.0 built to pkg/waldo-0.1.0.gem.
Tagged v0.1.0.
Pushed git commits and tags.
Pushed waldo 0.1.0 to rubygems.org.
```

# You're officially good to go!

Go check out your new gem on RubyGems.org!

As more details are found that would be useful and not too advanced they'll be added
to the repo. Also feel free to submit your own!
