module Apple
  module Music
    class Base
      attr_reader :id, :attributes, :href, :type, :relationships, :meta, :query_options, :client
      alias attrs attributes
      alias to_h attrs
      alias to_hash to_h
      
      def initialize(obj_hash = {}, query_options = {}, client = nil)
        # raise error if id is missing
        @id = obj_hash.fetch(:id)
        @type = obj_hash[:type]
        @href = obj_hash[:href]
        @attributes = obj_hash[:attributes] || {}
        @relationships = obj_hash[:relationships] || {}
        
        @object_readers = []
        
        @client = client
        @query_options = query_options
        
        # in docs but havent seen yet
        @meta = obj_hash[:meta]
        
        @requeried = false
      end
      
      def requery(options = {})
        @query_options = @query_options.merge(options)
        
        result = @client.perform_get(@href, @query_options)
        
        obj_hash = result[:data].first
        
        @attributes = obj_hash[:attributes] || {}
        @relationships = obj_hash[:relationships] || {}
        
        # reset the relation and attribute objects
        @object_readers.each do |instance_var|
          instance_variable_set("@#{instance_var}", nil)
        end
        
        @requeried = true
        
        self
      end
      
      def requeried?
        @requeried
      end
      
      def inspect
        "#<#{self.class.to_s} id: \"#{@id}\", type: \"#{@type}\", href: \"#{@href}\", attributes: #{@attributes}>"
      end
      
      def self.resource_attr_reader *keys
        keys.each do |key|
          key_camel_case = key.to_s.gsub(/(?:_|(\/))([a-z\d]?)/){ "#{$1}#{$2.upcase}" }.to_sym
          
          define_method(key) do
            @attributes[key_camel_case]
          end
        end
      end
      
      def self.object_attr_reader(klass_sym, *keys)
        object_reader :attributes, Apple::Music.const_get(klass_sym), *keys
      end
      
      def self.object_relation_reader(klass_sym, *keys)
        object_reader :relationships, Apple::Music::Relation.const_get(klass_sym), *keys
      end
      
      def self.object_reader(object_var, klass, *keys)
        define_method(keys.last) do
          obj = instance_variable_get("@#{keys.last}")
          return obj if obj
          
          @object_readers << keys.last
          
          object_attrs = instance_variable_get("@#{object_var}")
          keys.each do |key|
            object_attrs = object_attrs[key]
          end
          
          instance_variable_set("@#{keys.last}", klass.new(object_attrs, self)) unless object_attrs.nil?
        end
      end
      
    end
  end
end
