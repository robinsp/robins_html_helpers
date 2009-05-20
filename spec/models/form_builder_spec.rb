require File.expand_path(File.dirname(__FILE__) ) + "/../spec_helper"

describe RobinsHtmlHelpers::FormBuilder do 
  
  before do 
    @expected_attrib = :the_attrib
    
    @builder = RobinsHtmlHelpers::FormBuilder.new(nil, nil, nil, nil, nil)
    @mock_super = mock
    @mock_super.stubs(:label).returns("label-result")
    
    @builder.stubs(:get_super).returns(@mock_super)
    
  end
  
  it "should remove label param before delegating to super" do 
    expected_opts = {:opt => "val" }
    opts_with_label = expected_opts.merge(:label => "thelabel")
    
    [:text_field, :text_area, :password_field, :date_select].each do |method| 
      @mock_super.expects(method).with(@expected_attrib, expected_opts)
      @builder.send method, @expected_attrib, opts_with_label
    end
    
    @mock_super.expects(:check_box).with(@expected_attrib, expected_opts, 1.to_s, 0.to_s)
    @builder.send :check_box, @expected_attrib, opts_with_label
    
    @mock_super.expects(:select).with(@expected_attrib, {}, {}, expected_opts)
    @builder.send :select, @expected_attrib, {}, {}, opts_with_label
  end
  
end