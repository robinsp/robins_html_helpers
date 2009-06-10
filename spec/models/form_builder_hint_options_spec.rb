require File.expand_path(File.dirname(__FILE__) ) + "/../spec_helper"

describe RobinsHtmlHelpers::FormBuilder::HintOptions do
  
  before do 
    @class = RobinsHtmlHelpers::FormBuilder::HintOptions
  end

  it "should not allow :hint_class option without a :hint option" do 
    lambda { @class.new("", "CSS_class") }.should raise_error("No :hint supplied")
  end 
  
  it "should be enabled if hint is present" do 
    @class.new("hint", "class").enabled?.should be_true
  end
  
  it "should not be enabled if hint is blank" do 
    @class.new("", nil).enabled?.should be_false
    @class.new(nil, nil).enabled?.should be_false
  end
    
  it "should default :hint_class to 'hinting' " do 
    @class.new("hint", nil).hint_class.should == "hinting" 
  end
  
  it "should create Javascript from attributes given a dom_id" do 
    element_id, hint, hint_class = "element_id", "hint", "hint_class"
    expected_script = "new RobinsHtmlHelpers.FormFieldHint('#{element_id}', '#{hint}', '#{hint_class}');"

    @class.new(hint, hint_class).to_js(element_id).should == expected_script
  end
end
