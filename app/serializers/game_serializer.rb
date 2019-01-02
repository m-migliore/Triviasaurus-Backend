class GameSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :user
  has_many :rounds
end
