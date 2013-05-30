class PrimalCut < ActiveRecord::Base
  has_many   :cuts

  validates :name, :presence => true
end
