class CreateDiets < ActiveRecord::Migration[5.1]
  def change
    create_table :diets do |t|
      t.string :picture
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :diets, [:user_id, :created_at]
  end
end
