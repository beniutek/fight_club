require 'rails_helper'

RSpec.describe "fighters/show", type: :view do
  before(:each) do
    @fighter = assign(:fighter, Fighter.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
