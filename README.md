
# Test::Unit::Around

Use an around filter instead or in addition to test/unit's setup and teardown methods.
This is imho especially useful in combination with context blocks provided by e.g.,
the test-unit-context gem to avoid duplicate code.

## Installation

Add this line to your application's Gemfile:

```ruby
group :test do
  gem 'test-unit-around'
end
```

And then execute:

```
$ bundle
```

Alternatively, you can of course install it without bundler via:

```
$ gem install test-unit-around
```

## Usage

Use it in your tests:

```ruby
class FeatureTest < Test::Unit::TestCase
  def around
    # Before a test runs

    yield

    # After a test has run
  end

  def test_feature
    # First test
  end

  ...
end
```

You can as well use around as a class method:

```ruby
class FeatureTest < Test::Unit::TestCase
  around do |test|
    # Before a test runs

    test.run

    # After a test has run
  end

  test "feature" do
    # First test
  end

  ...
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

