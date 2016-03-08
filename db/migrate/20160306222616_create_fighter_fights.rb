class CreateFighterFights < ActiveRecord::Migration
  def change
    create_table :fighter_fights do |t|
      t.belongs_to :fighter, index: true
      t.belongs_to :fight, index: true
    end
  end
end
