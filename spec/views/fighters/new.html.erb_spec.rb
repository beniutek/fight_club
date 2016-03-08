require 'rails_helper'

RSpec.describe "fighters/new", type: :view do
  before(:each) do
    assign(:fighter, Fighter.new())
  end

  it "renders new fighter form" do
    render

    assert_select "form[action=?][method=?]", fighters_path, "post" do
    end
  end
end
