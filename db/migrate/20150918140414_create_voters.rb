class CreateVoters < ActiveRecord::Migration
  def change
    create_table :voters do |t|
      t.string :name
      t.string :voter_type
      t.string :voter_id

      t.timestamps null: false
    end
  end
end
