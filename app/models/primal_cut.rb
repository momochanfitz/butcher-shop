class PrimalCut < ActiveRecord::Base

  include ActiveModel::ForbiddenAttributesProtection

  has_many   :cuts
  belongs_to :animal

  attr_accessible :name

  validates :name, :presence => true
end
