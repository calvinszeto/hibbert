require 'rails_helper'

RSpec.describe "recommends/edit", :type => :view do
  before(:each) do
    @recommend = assign(:recommend, Recommend.create!())
  end

  it "renders the edit recommend form" do
    render

    assert_select "form[action=?][method=?]", recommend_path(@recommend), "post" do
    end
  end
end
