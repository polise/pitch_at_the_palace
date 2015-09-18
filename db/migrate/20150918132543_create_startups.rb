class CreateStartups < ActiveRecord::Migration
  def change
    create_table :startups do |t|
      t.string :name
      t.string :startup_id
      t.text :description
      t.string :photo
      t.integer :no_votes

      t.timestamps null: false
    end
  end
end
