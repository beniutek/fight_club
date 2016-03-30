class Fighter < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  has_many :fighter_skills, inverse_of: :fighter, autosave: true, dependent: :destroy
  has_many :fighter_fights
  has_many :fights, through: :fighter_fights
  has_many :skills, through: :fighter_skills
  has_many :comments

  accepts_nested_attributes_for :fighter_skills, allow_destroy: :true, reject_if: :all_blank

  validates :nickname, presence: true, uniqueness: true

  scope :most_experienced, -> { where('experience > 1').order(experience: :desc) }
  scope :most_fights, -> { joins(:fights).group('fighters.id').order("count(fighters.id) DESC, last_name ASC") }
  scope :most_wins, -> { joins('LEFT JOIN fights ON fighters.id = fights.winner_id').group('fighters.id').order("count(fights.winner_id) DESC, last_name ASC") }

  def points_sum
    experience + fighter_skills.count + fighter_skills.map(&:value).sum
  end

  def lvl_up(xp = 1)
    increment!(:experience, xp)
  end

  def fights_won
    fights.where(winner_id: id)
  end
end
