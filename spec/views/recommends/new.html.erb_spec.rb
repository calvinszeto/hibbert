require 'rails_helper'

RSpec.describe "recommends/new", :type => :view do
  before(:each) do
    assign(:recommend, Recommend.new())
  end

  it "renders new recommend form" do
    render

    assert_select "form[action=?][method=?]", recommends_path, "post" do
    end
  end
end
