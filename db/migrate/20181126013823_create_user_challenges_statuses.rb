class CreateUserChallengesStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_challenges_statuses do |t|
      t.string :description

      t.timestamps
    end

    add_foreign_key :user_challenges, :user_challenges_statuses, column: :status_id, primary_key: :id

  end
end
