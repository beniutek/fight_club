require 'rails_helper'

RSpec.describe "fighters/index", type: :view do
  before(:each) do
    assign(:fighters, [
      Fighter.create!(),
      Fighter.create!()
    ])
  end

  it "renders a list of fighters" do
    render
  end
end
