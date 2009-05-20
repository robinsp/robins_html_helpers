module RobinsHtmlHelpers 
  class FormBuilder < ActionView::Helpers::FormBuilder
    
    def text_field(method, options = {}) 
      label_text = options.delete(:label)
      wrap_field(method, get_super.text_field(method, options), label_text )
    end
    
    def text_area(method, options = {}) 
      label_text = options.delete(:label)
      wrap_field(method, get_super.text_area(method, options), label_text )
    end
    
    def password_field(method, options = {}) 
      label_text = options.delete(:label)
      wrap_field(method, get_super.password_field(method, options), label_text )
    end
    
    def date_select(method, options = {})
      label_text = options.delete(:label)
      wrap_field(method, get_super.date_select(method, options), label_text )
    end
    
    def check_box(method, options = {}, checked_value = "1", unchecked_value = "0")
      label_text = options.delete(:label)
      wrap_field(method, get_super.check_box(method, options, checked_value, unchecked_value), label_text )
    end
    
    def select(method, choices, options = {}, html_options = {})
      label_text = html_options.delete(:label)
      wrap_field(method, get_super.select(method, choices, options, html_options), label_text )
    end
  
    private 
    # Not sure how to mock 'super', so this is the work-around used by the specs
    def get_super
      super
    end
    
    def wrap_field(method, form_field, label_text)
      "<div class=\"custom_form_field\">#{get_super.label(method, label_text )} #{ form_field }</div>"
    end
  end
  
end