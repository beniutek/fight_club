class CreateFighters < ActiveRecord::Migration
  def change
    create_table :fighters do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :image
      t.integer :experience, default: 0

      t.timestamps null: false
    end
  end
end
