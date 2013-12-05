class FavoriteSerializer < ActiveModel::Serializer
  attributes :id,:user_id,:name

  has_one :cut
end