require 'rails_helper'

RSpec.describe "fights/show", type: :view do
  before(:each) do
    @fight = assign(:fight, Fight.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
