FactoryGirl.define do
  factory :fight do
    after(:build) do |fight|
      2.times { fight.fighters << create(:fighter) }
    end
  end
end
