class CreateChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :challenges do |t|
      t.string :name
      t.string :description
      t.timestamp :start_date
      t.timestamp :end_date
      t.integer :author_id

      t.timestamps
    end

    add_foreign_key :challenges, :users, column: :author_id, primary_key: :id
  end
end
