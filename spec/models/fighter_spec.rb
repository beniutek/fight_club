require 'rails_helper'

RSpec.describe Fighter, type: :model do
  context "there is already fighter with given nickname" do
      let!(:fighter) { create :fighter, nickname: "nickname"}
      let!(:fighter_2) { build :fighter, nickname: "nickname"}

    it "doeasn't create the fighter" do
      expect(fighter_2.validate).to eq false
    end
  end
end
