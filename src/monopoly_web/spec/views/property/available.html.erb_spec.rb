require 'spec_helper'

describe "/property/available" do
  before(:each) do
    render 'property/available'
  end

  #Delete this example and add some real ones or delete this file
  it "should tell you where to find the file" do
    response.should have_tag('p', %r[Find me in app/views/property/available])
  end
end
