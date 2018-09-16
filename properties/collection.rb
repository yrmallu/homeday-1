module Properties
  # Implement logic for working with collection of Properties::Item.
  class Collection
    attr_accessor :items

    def initialize(items = nil)
      @items = items || []
    end

    def to_h
      map(&:to_h)
    end

    def <<(item)
      @items << item
    end

    def map
      @items.map { |item| yield item }
    end

    def each
      @items.each { |item| yield item }
    end

    def size
      @items.size
    end
  end
end
