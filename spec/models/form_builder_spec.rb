require File.expand_path(File.dirname(__FILE__) ) + "/../spec_helper"

describe RobinsHtmlHelpers::FormBuilder do 
  
  before do 
    @expected_attrib = :the_attrib
    
    @mock_template = mock("the-template")
    @mock_template.stubs(:javascript_tag).returns("")
    
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
  
  [:text_field, :text_area, :password_field, :date_select, :check_box].each do |method|
    describe "#{method.to_s}()" do 
      it "should wrap_field" do 
        @mock_template.expects(method)
        @builder.expects(:wrap_field)
        @builder.send(method, @expected_attrib)
      end
    end
  end
  
  describe "select()" do 
    it "should wrap_field" do 
      @mock_template.expects(:select)
      @builder.expects(:wrap_field)
      @builder.select(@expected_attrib, {} )
    end
  end
  
  [:text_field, :text_area].each do |method| 
    describe "#{method.to_s}()" do 
      before do 
        @mock_template.stubs(method)
        @hint_options_class = RobinsHtmlHelpers::FormBuilder::HintOptions
        @hint_options_stub = @hint_options_class.new("Hint", "HintClass")
        @hint_options_stub.stubs(:enabled?).returns(false)
        @hint_options_class.stubs(:new).returns(@hint_options_stub)        
      end
      
      it "should remove :label param before delegating to super class" do 
        @mock_template.expects(method).with(@mock_object_name, @expected_attrib, @expected_opts)
        @builder.send method, @expected_attrib, @opts_with_label
      end
      
      it "should remove :hint and :hint_class options before delegating to super class" do 
        @mock_template.expects(method).with(@mock_object_name, @expected_attrib, @expected_opts)
        @builder.send method, @expected_attrib, {:opt => "val", :hint => "A hint", :hint_class => "CSS_class"}
      end
      
      it "should create HintOptions object" do 
        @hint_options_class.expects(:new).with("A hint", "CSS_class").returns(@hint_options_stub)
        @builder.send method, @expected_attrib, {:opt => "val", :hint => "A hint", :hint_class => "CSS_class"}
      end
      
      describe "with valid hint options" do 
        before do 
          @builder.stubs(:wrap_field).returns("field-result")
          @hint_options_stub.stubs(:enabled?).returns(true)
        end
        
        describe "and DOM id given by the developer" do 
          it "should create Javascript by supplying an DOM element id" do 
            @hint_options_stub.expects(:to_js).with("element_id")
            @builder.send method, @expected_attrib, {:id => "element_id", :hint => "A hint", :hint_class => "hint_class"}
          end
        end
        
        describe "When the DOM id is set by default" do 
          it "should create the hint JS by supplying an DOM element id, hint and hint_class" do 
            @hint_options_stub.expects(:to_js).with("#{@mock_object_name}_#{@expected_attrib.to_s}")
            @builder.send method, @expected_attrib, {:hint => "A hint", :hint_class => "hint_class"}
          end
        end
        
        it "should wrap the result of to_js() using javascript_tag helper and append it" do
          @hint_options_stub.expects(:to_js).returns("pure-js")
          @mock_template.expects(:javascript_tag).with("pure-js").returns("hint-result")
          @builder.send(method, @expected_attrib).should == "field-result" + "hint-result"
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