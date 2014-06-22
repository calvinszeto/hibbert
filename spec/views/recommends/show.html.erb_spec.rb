require 'rails_helper'

RSpec.describe "recommends/show", :type => :view do
  before(:each) do
    @recommend = assign(:recommend, Recommend.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
