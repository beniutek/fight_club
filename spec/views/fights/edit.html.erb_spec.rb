require 'rails_helper'

RSpec.describe "fights/edit", type: :view do
  before(:each) do
    @fight = assign(:fight, Fight.create!())
  end

  it "renders the edit fight form" do
    render

    assert_select "form[action=?][method=?]", fight_path(@fight), "post" do
    end
  end
end
