
require File.expand_path("../../../../lib/test/unit/around", __FILE__)
require "test/unit"

class AroundClassMethodTest < Test::Unit::TestCase
  around do |test|
    @before = :before

    test.run

    @after = :after

    assert_equal :after, @after
  end

  def test_around
    assert_equal :before, @before
    assert_not_equal :after, @after
  end
end

class AroundInstanceMethodTest < Test::Unit::TestCase
  def around
    @before = :before

    yield

    @after = :after

    assert_equal :after, @after
  end

  def test_around
    assert_equal :before, @before
    assert_not_equal :after, @after
  end
end

class WithoutAroundTest < Test::Unit::TestCase
  def test_something
    assert_equal 1, 1
  end
end

