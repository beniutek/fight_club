class Fighter < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  has_many :fighter_skills, inverse_of: :fighter, autosave: true, dependent: :destroy
  has_many :fighter_fights
  has_many :fights, through: :fighter_fights
  has_many :skills, through: :fighter_skills

  accepts_nested_attributes_for :fighter_skills, allow_destroy: :true, reject_if: :all_blank

  validates :nickname, presence: true, uniqueness: true
end
