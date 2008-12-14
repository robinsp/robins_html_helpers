require File.expand_path(File.dirname(__FILE__) ) + "/../spec_helper"

describe "boxed_content", :type => :helper do 
  it "should be accessible by default"
  
  it "should wrap everything in a div to avoid margin problems in IE"
  
  it "should be possible to set the html id of the outer div"
  
  it "should be possible to set the html id of the inner div"
  
  it "should be possible to override the default CSS class of the outer div"
  
  it "should be possible to override the default CSS class of the inner div"
  
  it "should use default CSS classes" do
    result = eval_erb("<% boxed_content do %> <%end%>")
    result.should have_tag("div.box_bottom_left") do 
      with_tag("div.box_bottom_right") do 
        with_tag("div.box_top_left") do 
          with_tag("div.box_top_right")
        end
      end
    end
  end
  
end 
