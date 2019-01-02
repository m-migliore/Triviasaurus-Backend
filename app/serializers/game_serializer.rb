class GameSerializer < ActiveModel::Serializer
  attributes :id, :rounds
  belongs_to :user
  has_many :rounds
end
