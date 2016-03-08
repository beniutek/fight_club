require 'rails_helper'

RSpec.describe "fights/new", type: :view do
  before(:each) do
    assign(:fight, Fight.new())
  end

  it "renders new fight form" do
    render

    assert_select "form[action=?][method=?]", fights_path, "post" do
    end
  end
end
