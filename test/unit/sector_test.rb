require File.dirname(__FILE__) + '/../test_helper'

class SectorTest < Test::Unit::TestCase
  fixtures :sectors

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Sector, sectors(:first)
  end
end
