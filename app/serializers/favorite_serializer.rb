class FavoriteSerializer < ActiveModel::Serializer
  attributes :id,:user_id,:cut_id, :name

  has_one :cut
end