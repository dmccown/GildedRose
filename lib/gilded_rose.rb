require_relative 'inventory/inventory_item'
require_relative 'inventory/sulfuras'
require_relative 'inventory/backstage_pass'
require_relative 'inventory/brie'
require_relative 'item'

class GildedRose
  @items = []

  def initialize
    @items = []
    @items << Item.new("+5 Dexterity Vest", 10, 20)
    @items << Item.new("Aged Brie", 2, 0)
    @items << Item.new("Elixir of the Mongoose", 5, 7)
    @items << Item.new("Sulfuras, Hand of Ragnaros", 0, 80)
    @items << Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)
    @items << Item.new("Conjured Mana Cake", 3, 6)
  end

  def items=(items)
    @items = items
  end

  def first
    @items.first
  end

  def update_quality
    for item in @items
      create_inventory_item(item).update
    end
  end

  def create_inventory_item(item)
    if item.name == "Sulfuras, Hand of Ragnaros"
      Inventory::Sulfuras.new(item)
    elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
      Inventory::BackstagePass.new(item)
    elsif item.name == "Aged Brie"
      Inventory::Brie.new(item)
    else
      Inventory::InventoryItem.new(item)
    end
  end
end
