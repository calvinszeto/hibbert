require 'rails_helper'

RSpec.describe "recommends/index", :type => :view do
  before(:each) do
    assign(:recommends, [
      Recommend.create!(),
      Recommend.create!()
    ])
  end

  it "renders a list of recommends" do
    render
  end
end
