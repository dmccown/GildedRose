module Inventory
  class InventoryItem
    def initialize(item)
      @item = item
    end

    def update
      reduce_quality
      remove_day
      reduce_quality if expired?
    end

    def expired?
      @item.sell_in < 0
    end

    def remove_day
      @item.sell_in = @item.sell_in - 1;
    end

    def reduce_quality
      if (@item.quality > 0)
        @item.quality = @item.quality - 1
      end
    end

    def increase_quality
      if (@item.quality < 50)
        @item.quality = @item.quality + 1
      end
    end
  end


end
