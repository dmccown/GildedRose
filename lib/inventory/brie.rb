require_relative 'inventory_item'

module Inventory
  class Brie < InventoryItem
    def update
      increase_quality
      remove_day
      increase_quality if expired?
    end
  end
end
