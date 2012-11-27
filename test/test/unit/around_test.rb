
require File.expand_path("../../../../lib/test/unit/around", __FILE__)
require "test/unit"

class AroundClassMethodTest < Test::Unit::TestCase
  setup do
    assert_nil @before
    assert_nil @after
  end

  around do |test|
    @before = :before

    test.run

    @after = :after
  end

  teardown do
    assert_equal :before, @before
    assert_equal :after, @after
  end

  test "around" do
    assert_equal :before, @before

    assert_nil @after
  end
end

class AroundInstanceMethodTest < Test::Unit::TestCase
  def setup
    assert_nil @before
    assert_nil @after
  end

  def around
    @before = :before

    yield

    @after = :after
  end

  def teardown
    assert_equal :before, @before
    assert_equal :after, @after
  end

  def test_around
    assert_equal :before, @before

    assert_nil @after
  end
end

class WithoutAroundTest < Test::Unit::TestCase
  def test_something
    assert_nil @before
    assert_nil @after

    assert_equal 1, 1
  end
end

