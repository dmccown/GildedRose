require_relative 'inventory_item'

module Inventory
  class BackstagePass < InventoryItem
    def update
      increase_quality
      increase_quality if @item.sell_in < 11
      increase_quality if @item.sell_in < 6
      remove_day
      reset_quality if @item.sell_in < 0
    end

    def reset_quality
      @item.quality = 0
    end
  end
end
