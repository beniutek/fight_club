class Fight < ActiveRecord::Base
  has_many :fighter_fights
  has_many :fighters, through: :fighter_fights

  validate :has_two_fighters

  def has_two_fighters
    if fighters.size != 2
      errors.add(:fight, "has to have 2 fighters")
    end
  end
end
