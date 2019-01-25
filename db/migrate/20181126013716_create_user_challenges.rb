class CreateUserChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :user_challenges do |t|
      t.integer :user_id
      t.integer :challenge_id
      t.timestamp :accept_date
      t.integer :status_id

      t.timestamps
    end

    add_foreign_key :user_challenges, :users, column: :user_id, primary_key: :id
    add_foreign_key :user_challenges, :challenges, column: :challenge_id, primary_key: :id



  end
end
