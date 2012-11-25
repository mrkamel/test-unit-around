# Test::Unit::Around

Use an around filter instead or in addition to test/unit's setup and teardown methods.

## Installation

Add this line to your application's Gemfile:

    group :test do
      gem 'test-unit-around', :git => "git://github.com/mrkamel/test-unit-around.git"
    end

And then execute:

    $ bundle

## Usage

Use it in your tests:

<pre>
class FeatureTest &lt; Test::Unit::TestCase
  def around
    # Before the test runs

    yield

    # After the test has run
  end

  def test_feature
    # The test itself
  end
end
</pre>

You can as well use around as a class method:

<pre>
class FeatureTest &lt; Test::Unit::TestCase
  around do |test|
    # Before the test runs

    test.run

    # After the test has run
  end

  ...
end
</pre>

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

