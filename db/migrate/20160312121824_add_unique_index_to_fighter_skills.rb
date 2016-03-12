class AddUniqueIndexToFighterSkills < ActiveRecord::Migration
  def change
    add_index :fighter_skills, [:fighter_id,:skill_id], unique: true
  end
end
