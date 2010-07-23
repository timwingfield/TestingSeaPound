require 'spec_helper'

describe "/index/list" do
  before(:each) do
    render 'index/list'
  end

  #Delete this example and add some real ones or delete this file
  it "should tell you where to find the file" do
    response.should have_tag('p', %r[Find me in app/views/index/list])
  end
end
