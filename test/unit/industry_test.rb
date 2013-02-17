require File.dirname(__FILE__) + '/../test_helper'

class IndustryTest < Test::Unit::TestCase
  fixtures :industries

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Industry, industries(:first)
  end
end
