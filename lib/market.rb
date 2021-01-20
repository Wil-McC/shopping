class Market
  attr_reader :name,
              :vendors

  def initialize(name)
    @name    = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.select do |vendor|
      vendor.check_stock(item) > 0
    end
  end

  def items_sold
    @vendors.flat_map do |vendor|
      vendor.items_sold
    end.uniq
  end

  def total_quantity(item)
    @vendors.sum do |vendor|
      vendor.check_stock(item)
    end
  end

  def overstocked_items
    items_sold.select do |item|
      total_quantity(item) > 50 && vendors_that_sell(item).length > 1
    end
  end

  def sorted_item_list
    items_sold.map do |item|
      item.name
    end.sort
  end

  def total_inventory
    items_sold.each_with_object({}) do |item, hash|
      hash[item] = { quantity: total_quantity(item),
                     vendors: vendors_that_sell(item)
                   }
    end
  end

  def sell(item, quantity)
    if total_quantity(item) < quantity
      false
    else
      sell_by_vendor(item, quantity)
    end
  end

  # def sell_by_vendor(item, quantity)
    # left_to_buy = quantity
    # vendors_that_sell(item).each do |vendor|
      # vendor_stock = vendor.check_stock(item)
      # vendor.inventory[item] -= vendor_stock
      # left_to_buy -= vendor_stock
    # end
  # end
end
