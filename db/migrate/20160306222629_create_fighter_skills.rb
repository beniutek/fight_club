class CreateFighterSkills < ActiveRecord::Migration
  def change
    create_table :fighter_skills do |t|
      t.integer :value, default: true

      t.belongs_to :skill, index: true
      t.belongs_to :fighter, index: true
    end
  end
end
