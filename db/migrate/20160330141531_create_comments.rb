class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author
      t.text :body
      t.belongs_to :fighter
      t.timestamps null: false
    end
  end
end
