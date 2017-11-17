module Apple
  module Music
    class Artwork
      attr_reader :width, :height, :text_colors, :bg_color, :attributes
      
      def initialize(attrs = {}, parent = nil)
        @parent = parent
        
        @supports_layered_image = attrs[:supportsLayeredImage]
        @text_colors = [
          attrs[:textColor1],
          attrs[:textColor2],
          attrs[:textColor3],
          attrs[:textColor4]
        ]
        @bg_color = attrs[:bgColor]
        @no_dimensions = attrs[:width].nil? && attrs[:height].nil? 
        @width = attrs[:width].nil? ? 1 : attrs[:width].to_i
        @height = attrs[:height].nil? ? 1 : attrs[:height].to_i
        @url = attrs[:url]
        @attributes = attrs
      end
      
      def raw_url
        @url
      end
      
      def url(width: nil, height: nil, format: nil, cropping: nil)
        
        # apple music api has cropping and format hardcoded 
        # replace if needed or figure out what it is using
        res = @url.gsub(/\{h\}.+$/ , "{h}{c}.{f}")
        match = @url.match(/\{h\}(?<cropping>.+)\.(?<format>.+)$/)
        
        format ||= (match[:format] == '{f}') ? 'png' : match[:format] 
        cropping ||= (match[:cropping] == '{c}') ? 'bb' : match[:cropping] 
        
        new_width, new_height = self.adjust_sizes(width: width, height: height, cropping: cropping)
        
        
        res = res.gsub(/\{\w\}/) do |match|
          case match
          when '{w}'
            new_width
          when '{h}'
            new_height
          when '{c}'
            cropping
          when '{f}'
            format
          end
        end
        
        res
      end
      
      # this might not always work
      def secure_url(width: nil, height: nil, format: nil, cropping: nil)
        url(width: width, height: height, format: format, cropping: cropping).sub(/http:\/\/(.+?)\./, 'https://\1-ssl.')
      end
      
      def adjust_sizes(width: nil, height: nil, cropping: nil)
        if (cropping == 'cc' || cropping == 'sr' || cropping == 'bf') && !width.blank? && !height.blank?
          # if the cropping is gonna cut the image and we have a width and height use that
          [width, height]
        else
          width = 200 if width.nil? && height.nil?
          width = (@width / (@height / height.to_f)) if width.nil? && !height.nil?
          height = (@height / (@width / width.to_f)) if height.nil?
                  
          new_width = width
          new_height = height
            
          unless @no_dimensions
            modifier = [(@width / width.to_f), (@height / height.to_f)].max
            new_width = (@width / modifier).round
            new_height = (@height / modifier).round
          end
          
          [new_width.to_i, new_height.to_i]
        end
      end
    end
  end
end
