module RobinsHtmlHelpers
  
  # TODO: Document the options argument
  def boxed_content(options = {},  &block)
    # Default class names
    options[:bottom_left_class] ||= 'box_bottom_left'
    options[:bottom_right_class] ||= 'box_bottom_right'
    options[:top_left_class] ||= 'box_top_left'
    options[:top_right_class] ||= 'box_top_right'
    
    if options[:inner_class]
      options[:inner_class] = options[:inner_class] + " " + options[:top_right_class]
    else 
      options[:inner_class] = options[:top_right_class]
    end 
    
    if options[:outer_class]
      options[:outer_class] = options[:outer_class] + " " + options[:bottom_left_class]
    else 
      options[:outer_class] = options[:bottom_left_class]
    end 
    
    concat(
      
      content_tag(:div, :style => "padding-top: 1px;") do # Extra div to fix margin problems in IE 6
      content_tag(:div, :class => options[:outer_class], :id => options[:outer_id] ) do   
        content_tag(:div, :class => options[:bottom_right_class]) do 
          content_tag(:div, :class => options[:top_left_class]) do
            content_tag(:div, :class => options[:inner_class], :id => options[:inner_id]) do
              capture(&block)
            end
          end
          
        end 
      end
      end
    )
  end
end


ActionView::Base.class_eval do
  include RobinsHtmlHelpers
end