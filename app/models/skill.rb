class Skill < ActiveRecord::Base
  has_many :fighter_skills
  has_many :fighters
end
