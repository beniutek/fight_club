class FighterFight < ActiveRecord::Base
  belongs_to :fighter
  belongs_to :fight

  validates :fighter, uniqueness: { scope: :fight, message: "duplicated fighter" }
end
