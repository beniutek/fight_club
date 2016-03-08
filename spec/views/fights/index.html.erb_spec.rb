require 'rails_helper'

RSpec.describe "fights/index", type: :view do
  before(:each) do
    assign(:fights, [
      Fight.create!(),
      Fight.create!()
    ])
  end

  it "renders a list of fights" do
    render
  end
end
