require 'rails_helper'

RSpec.describe "fighters/edit", type: :view do
  before(:each) do
    @fighter = assign(:fighter, Fighter.create!())
  end

  it "renders the edit fighter form" do
    render

    assert_select "form[action=?][method=?]", fighter_path(@fighter), "post" do
    end
  end
end
