require File.expand_path(File.dirname(__FILE__) ) + "/../spec_helper"

describe RobinsHtmlHelpers::FormBuilder do 
  
  before do 
    @expected_attrib = :the_attrib
    
    
    @mock_template = mock("the-template")
    @mock_object_name = mock('object-name')
    @mock_the_object = mock('the-object')
    
    @builder = RobinsHtmlHelpers::FormBuilder.new(@mock_object_name, 
                                                  @mock_the_object, 
                                                  @mock_template, 
                                                  nil, nil)
                                                  
    @mock_template.stubs(:label).returns("label-result")
    @builder.stubs(:get_super).returns(@mock_template)
    
  end
  
  it "should remove label param before delegating to super" do 
    expected_opts = {:object => @mock_the_object, :opt => "val" }
    opts_with_label = {:opt => "val", :label => "thelabel"}
    
    [:text_field, :text_area, :password_field].each do |method| 
      @mock_template.expects(method).with(@mock_object_name, @expected_attrib, expected_opts)
      @builder.send method, @expected_attrib, opts_with_label
    end
    
    @mock_template.expects(:date_select).with(@mock_object_name, @expected_attrib, expected_opts, {})
    @builder.send :date_select, @expected_attrib, opts_with_label
    
    @mock_template.expects(:check_box).with(@mock_object_name, @expected_attrib, expected_opts, 1.to_s, 0.to_s)
    @builder.send :check_box, @expected_attrib, opts_with_label
    
    @mock_template.expects(:select).with(@mock_object_name, @expected_attrib, {}, {:object => @mock_the_object}, {:opt => "val" })
    @builder.send :select, @expected_attrib, {}, {}, opts_with_label
  end
  
end