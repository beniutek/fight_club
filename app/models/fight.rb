class Fight < ActiveRecord::Base
  has_many :fighter_fights
  has_many :fighters, through: :fighter_fights

  validate :has_two_fighters

  after_create :set_winner, :update_fighters
  def has_two_fighters
    if fighters.size != 2
      errors.add(:fight, "has to have 2 fighters")
    end
  end

  def set_winner
    update_attribute(:winner_id, calculate_winner)
  end

  def calculate_winner
    fighters.first.points_sum > fighters.last.points_sum ? fighters.first.id : fighters.last.id
  end

  def update_fighters
    fighters.first.id == winner_id ? lvl_up(fighters.first, fighters.last) : lvl_up(fighters.last, fighters.first)
  end

  def lvl_up winner, looser
    winner.lvl_up 2
    looser.lvl_up
  end

end
