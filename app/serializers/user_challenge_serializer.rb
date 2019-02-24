class UserChallengeSerializer < ActiveModel::Serializer
  attributes :id, :challenge_id, :user_id, :status_id, :accept_date,            :created_at, :updated_at
  belongs_to :challenge
end
