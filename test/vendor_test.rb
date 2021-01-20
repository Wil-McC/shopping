require_relative 'test_helper'

class VendorTest < Minitest::Test

  def setup
    @vendor = Vendor.new("Rocky Mountain Fresh")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end

  def test_it_exists_with_attributes
    assert_instance_of Vendor, @vendor
    assert_equal "Rocky Mountain Fresh", @vendor.name
    assert_equal Hash.new, @vendor.inventory
  end

  def test_it_check_stock
    assert_equal 0, @vendor.check_stock(@item1)
  end

  def test_it_stocks_items
    expected = {
      @item1 => 55,
      @item2 => 12
    }
    @vendor.stock(@item1, 30)
    assert_equal 30, @vendor.check_stock(@item1)
    @vendor.stock(@item1, 25)
    assert_equal 55, @vendor.check_stock(@item1)
    @vendor.stock(@item2, 12)
    assert_equal expected, @vendor.inventory
  end

  def test_potential_revenue
    @vendor.stock(@item1, 30)
    assert_equal 22.50, @vendor.potential_revenue
  end
end
