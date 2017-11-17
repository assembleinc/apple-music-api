module Apple
  module Music
    module Relation
      require 'forwardable'
      
      class Base
        extend Forwardable
        def_delegators :@items, :<<, :count, :size, :[], :map, :each, :first  # and anything else
        
        attr_reader :href, :next
        
        def initialize(attrs = {}, parent = nil)
          @parent = parent
          @href = attrs[:href]
          @next = attrs[:next]
          
          @includes = (@parent.query_options[:include] || "").to_s.split(',').map(&:strip)
          
          @items = attrs[:data].map do |item|
            # see if the parent is the related item
            if item[:id] == parent.id
              parent
            else
              item_klass.new(item, @parent.query_options, @parent.client)
            end
          end
          
          @full_items = (@includes.length > 0) && @includes.include?(@items.first.type)
        end
        
        def item_klass
          Apple::Music::Base
        end
        
        def full_items?
          @full_items
        end
        
        # Requery the items
        def query
          if !full_items?
            @items = @parent.client.perform_get_objects(item_klass, @href, @parent.query_options)
            @full_items = true
          end
        end
        
      end
    end
  end
end
