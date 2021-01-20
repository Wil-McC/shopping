class Vendor
  attr_reader :inventory,
              :name

  def initialize(name)
    @name      = name
    @inventory = Hash.new(0)
  end

  def stock(item, quantity)
    @inventory[item] += quantity
  end

  def check_stock(item)
    @inventory[item]
  end

  def potential_revenue
    @inventory.sum do |i, q|
      i.price * q
    end
  end

  def items_sold
    @inventory.keys
  end
end
