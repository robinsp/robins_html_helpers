module RobinsHtmlHelpers 
  
  # Customized form builder that inserts an HTML label tag before the form 
  # fields and wraps the +label+ and input elements in an enclosing div tag.
  # The enclosing +div+ has class +custom_form_field+ by default.
  #
  #--
  #    <% form_for( @item, :builder => RobinsHtmlHelpers::FormBuilder) do |f| %>
  #      <%= f.text_field :name %>
  #    <%end%>
  #
  #    <div class="custom_form_field">
  #        <label for="item_name">Name</label> 
  #        <input type="text" value="Get filofax pen from anders/mf" size="30" name="item[name]" id="item_name"/>
  #    </div>
  #
  #++
  #
  # For text_field and text_area a hint options can be passed to set default
  # text using javascript. (This requires that you have included the javascript
  # and css files that come with this gem. Refer to the README file for 
  # instructions.)
  class FormBuilder < ActionView::Helpers::FormBuilder
    class HintOptions #:nodoc:
      attr_reader :hint, :hint_class
      
      def initialize(hint, hint_class)
        raise "No :hint supplied" if hint_class && hint.blank?
        @hint = hint
        @hint_class = hint_class || "hinting"
      end
      
      def enabled?
        !hint.blank?
      end
      
      def to_js(dom_element_id) 
        "new RobinsHtmlHelpers.FormFieldHint('#{dom_element_id}', '#{hint}', '#{hint_class}');"  
      end
    end
    
    def text_field(method, options = {}) 
      text_input_field(method, options) do 
        super(method, options)
      end
    end
    
    def text_area(method, options = {}) 
      text_input_field(method, options) do 
        super(method, options)
      end
    end
        
    def password_field(method, options = {}) 
      label_text = options.delete(:label)
      wrap_field(method, super(method, options), label_text )
    end
    
    def date_select(method, options = {})
      label_text = options.delete(:label)
      wrap_field(method, super(method, options), label_text )
    end
    
    def check_box(method, options = {}, checked_value = "1", unchecked_value = "0")
      label_text = options.delete(:label)
      wrap_field(method, super(method, options, checked_value, unchecked_value), label_text )
    end
    
    def select(method, choices, options = {}, html_options = {})
      label_text = html_options.delete(:label)
      wrap_field(method, super(method, choices, options, html_options), label_text )
    end
  
    private
    def wrap_field(method, form_field, label_text)
      "<div class=\"custom_form_field\">#{label(method, label_text )} #{ form_field }</div>"
    end
    
    def get_dom_id_from(options, method)
      return options[:id] || object_name + "_" + method.to_s
    end
    
    def text_input_field(method, options = {})
      label_text = options.delete(:label)
      hint_options = HintOptions.new(options.delete(:hint), options.delete(:hint_class))

      result = wrap_field(method, yield, label_text )
      
      if hint_options.enabled?
        result << @template.javascript_tag( hint_options.to_js( get_dom_id_from(options, method) ) )
      end
      
      result
    end
  end
  
end