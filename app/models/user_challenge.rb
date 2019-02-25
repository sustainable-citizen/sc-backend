class UserChallenge < ApplicationRecord
  belongs_to :challenge
  # validations
  # validates_presence_of :user_id
  # validates_presence_of :challenge_id
  # validates_presence_of :accept_date
  # validates_presence_of :status_id
end
