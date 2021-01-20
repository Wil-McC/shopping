require_relative 'test_helper'

class ItemTest < Minitest::Test

  def setup
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end

  def test_it_exists_with_attributes
    assert_instance_of Item, @item1
    assert_equal 0.75, @item1.price
    assert_equal 0.5, @item2.price
  end
end
