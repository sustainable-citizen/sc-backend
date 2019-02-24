class UserChallengeSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :challenge
end
