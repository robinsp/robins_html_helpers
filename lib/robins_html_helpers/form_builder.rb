module RobinsHtmlHelpers 
  class FormBuilder < ActionView::Helpers::FormBuilder
    
    def text_field(method, options = {}) 
      label_text = options.delete(:label)
      hint, hint_class = options.delete(:hint), options.delete(:hint_class)
      the_dom_id = options[:id] || object_name + "_" + method.to_s
      raise "No :hint supplied" if hint_class && hint.blank?

      result = wrap_field(method, super(method, options), label_text )
      result << hint_js_tag(the_dom_id, hint, (hint_class || "hinting")) unless hint.blank?
      result
    end
    
    def text_area(method, options = {}) 
      label_text = options.delete(:label)
      hint, hint_class = options.delete(:hint), options.delete(:hint_class)
      the_dom_id = options[:id] || object_name + "_" + method.to_s
      
      raise "No :hint supplied" if hint_class && hint.blank?

      result = wrap_field(method, super(method, options), label_text )
      result << hint_js_tag(the_dom_id, hint, (hint_class || "hinting")) unless hint.blank?
      result
    end
    
    def hint_js_tag(element_id, hint, hint_class)
      raise "Missing arg" if element_id.blank? || hint.blank? || hint_class.blank?
      script = "new RobinsHtmlHelpers.FormFieldHint('#{element_id}', '#{hint}', '#{hint_class}');"
      @template.javascript_tag(script)
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
  end
  
end