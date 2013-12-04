class PrimalCut < ActiveRecord::Base
  has_many   :cuts
  belongs_to :animal


  validates :name, :presence => true
end
