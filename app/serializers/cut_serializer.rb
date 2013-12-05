class CutSerializer < ActiveModel::Serializer
  attributes :id, :favorite_id, :animal_id, :primal_cut_id, :name
end
