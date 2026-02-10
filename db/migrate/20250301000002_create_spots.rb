class CreateSpots < ActiveRecord::Migration[8.1]
  def change
    create_table :spots do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.text :description
      t.string :city, null: false
      t.string :state, null: false
      t.string :status, null: false, default: "draft"

      t.timestamps
    end
  end
end
