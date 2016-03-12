class FighterSkill < ActiveRecord::Base

  belongs_to :fighter, inverse_of: :fighter_skills
  belongs_to :skill

  accepts_nested_attributes_for :skill

  validates_uniqueness_of :skill_id, scope: :fighter_id
end
