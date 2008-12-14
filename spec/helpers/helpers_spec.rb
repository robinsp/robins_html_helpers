require File.expand_path(File.dirname(__FILE__) ) + "/../spec_helper"

describe "boxed_content", :type => :helper do 
  before do 
    @default_result = boxed_content
  end
  
  it "should be accessible to rails apps by default" do 
    ActionView::Base.new.methods.should include("boxed_content")
  end
  
  it "should be possible to set the html id of the outer div" do
    @default_result.should_not have_tag("div#my_id")
    boxed_content(:outer_id => "my_id").should have_tag("div#my_id")
  end
  
  it "should be possible to set the html id of the inner div" do
    @default_result.should_not have_tag("div#my_id")
    boxed_content(:inner_id => "my_id").should have_tag("div#my_id")
  end
  
  it "should be possible to override the default CSS class of the outer div" do 
    @default_result.should_not have_tag("div.my_class")
    boxed_content(:outer_class => "my_class").should have_tag("div.my_class")
  end
  
  it "should be possible to override the default CSS class of the inner div" do 
    @default_result.should_not have_tag("div.my_class")
    boxed_content(:inner_class => "my_class").should have_tag("div.my_class")
  end
  
  it "should set default CSS classes" do
    boxed_content.should have_tag("div") do 
      with_tag("div.box_bottom_left") do 
        with_tag("div.box_bottom_right") do 
          with_tag("div.box_top_left") do 
            with_tag("div.box_top_right")
          end
        end
      end
    end
  end
  
  it "should be possible to use all params at the same time" do 
    params = {:outer_id =>    "my_outer_id",
              :inner_id =>    "my_inner_id", 
              :outer_class => "my_outer_class",
              :inner_class => "my_inner_class" }
              
    boxed_content(params).should have_tag("div") do
      with_tag("div.my_outer_class")
      with_tag("div#my_outer_id") do 
        with_tag("div") do
          with_tag("div") do
            with_tag("div.my_inner_class")
            with_tag("div#my_inner_id")
          end
        end
      end
    end
    
  end
  
  it "should wrap everything in a div to avoid margin problems in IE"
  
  it "should be possible to omitt the div that fixes the IE margin problems"
  
  def boxed_content(params = {})
    eval_erb("<% boxed_content(#{params.inspect}) do %> <%end%>")
  end
  
end 
