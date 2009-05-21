require File.expand_path(File.dirname(__FILE__) ) + "/../spec_helper"

describe RobinsHtmlHelpers::FormBuilder do 
  
  before do 
    @expected_attrib = :the_attrib
    
    @mock_template = mock("the-template")
    @mock_object_name = 'object-name'
    @mock_the_object = mock('the-object')
    
    @builder = RobinsHtmlHelpers::FormBuilder.new(@mock_object_name, 
                                                  @mock_the_object, 
                                                  @mock_template, 
                                                  nil, nil)
                                                  
    @mock_template.stubs(:label).returns("label-result")
    @builder.stubs(:get_super).returns(@mock_template)
    
    @expected_opts = {:object => @mock_the_object, :opt => "val" }
    @opts_with_label = {:opt => "val", :label => "thelabel" }
    
  end
  
  [:text_field, :text_area, :password_field, :date_select, :select, :check_box].each do |method|
    describe "#{method.to_s}()" do 
      it "should wrap_field"
    end
  end
  
  
  [:text_field, :text_area].each do |method| 
    describe "#{method.to_s}()" do 
      it "should remove :label param before delegating to super class" do 
        @mock_template.expects(method).with(@mock_object_name, @expected_attrib, @expected_opts)
        @builder.send method, @expected_attrib, @opts_with_label
      end
      
      
      describe "with hints" do 
        it "should remove :hint and :hint_class options before delegating to super class" do 
          @mock_template.expects(method).with(@mock_object_name, @expected_attrib, @expected_opts)
          @builder.send method, @expected_attrib, {:opt => "val", :hint => "A hint", :hint_class => "CSS_class"}
        end
        
        it "should not allow :hint_class option without a :hint option" do 
          lambda { @builder.send(method, @expected_attrib, {:hint_class => "CSS_class"}) }.should  raise_error "No :hint supplied"
        end 
        
        it "should append hint JS" do 
          @mock_template.stubs(method)
          @builder.stubs(:wrap_field).returns("field-result")
          @builder.expects(:hint_js_tag).returns("hint-result")
          @builder.send(method, @expected_attrib, {:hint => "A hint"}).should == "field-result" + "hint-result"
        end
        
        it "should default :hint_class to 'hinting' " 
        
        it "should create the hint JS by supplying an DOM element id, hint and hint_class" do
          @mock_template.stubs(method)
          @builder.stubs(:wrap_field).returns("field-result")
          
          # When the DOM id is given by the developer
          @builder.expects(:hint_js_tag).with("element_id", "A hint", "hint_class").returns("hint-result")
          @builder.send method, @expected_attrib, {:id => "element_id", :hint => "A hint", :hint_class => "hint_class"}
          
          # When the DOM id is set by default
          @builder.expects(:hint_js_tag).with("#{@mock_object_name}_#{@expected_attrib.to_s}", "A hint", "hint_class").returns("hint-result")
          @builder.send method, @expected_attrib, {:hint => "A hint", :hint_class => "hint_class"}
        end
        
      end 
    end
  end
  
  describe "password_field()" do 
    it "should remove :label option before delegating to super class" do 
      @mock_template.expects(:password_field).with(@mock_object_name, @expected_attrib, @expected_opts)
      @builder.password_field(@expected_attrib, @opts_with_label)
    end
  end
  
  describe "date_select()" do 
    it "should remove :label option before delegating to super class" do 
      @mock_template.expects(:date_select).with(@mock_object_name, @expected_attrib, @expected_opts, {})
      @builder.date_select(@expected_attrib, @opts_with_label)
    end
  end
  
  describe "select()" do 
    it "should remove :label option before delegating to super class" do 
      @mock_template.expects(:select).with(@mock_object_name, @expected_attrib, {}, {:object => @mock_the_object}, {:opt => "val" })
      @builder.select( @expected_attrib, {}, {}, @opts_with_label )
    end
  end
  
  describe "check_box()" do 
    it "should remove :label option before delegating to super class" do 
      @mock_template.expects(:check_box).with(@mock_object_name, @expected_attrib, @expected_opts, 1.to_s, 0.to_s)
      @builder.check_box( @expected_attrib, @opts_with_label )
    end
  end

end