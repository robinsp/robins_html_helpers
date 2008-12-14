module RobinsHtmlHelpers

  # Wraps the content of its enclosed block in four divs that can hold corner images 
  # to create a rounded corner effect on a web page. 
  #
  # ==== Example
  #
  #   <% boxed_content do %>
  #     <p>Wrap me!</p>
  #   <% end %>
  #
  # Produces this HTML:
  #
  #   <div class="box_bottom_left">
  #     <div class="box_bottom_right">
  #       <div class="box_top_left">
  #         <div class="box_top_right"> 
  #           <p>Wrap me!</p>
  #         </div>
  #       </div>
  #     </div>
  #   </div>
  #
  #
  # The optional hash argument can be used to customize the classes and ids of the outermost 
  # and innermost divs:
  #
  # * <tt>:outer_class</tt> - CSS class of the outer div. Defaults to <tt>box_bottom_left</tt>
  # * <tt>:inner_class</tt> - CSS class of the inner div. Defaults to <tt>box_top_right</tt>
  # * <tt>:outer_id</tt> - HTML id of the outer div. (Not set by default)
  # * <tt>:inner_id</tt> - HTML id of the inner div. (Not set by default)
  def boxed_content(options = {},  &block)
    # Default class names
    options[:bottom_left_class]   ||= 'box_bottom_left'
    options[:bottom_right_class]  ||= 'box_bottom_right'
    options[:top_left_class]      ||= 'box_top_left'
    options[:top_right_class]     ||= 'box_top_right'
    
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
              capture(&block) if block.present?
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