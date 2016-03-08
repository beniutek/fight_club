class FighterSkill < ActiveRecord::Base

  belongs_to :fighter, inverse_of: :fighter_skills
  belongs_to :skill

  accepts_nested_attributes_for :skill

  validates :fighter, uniqueness: { scope: :skill, message: "duplicated skill" }
end
