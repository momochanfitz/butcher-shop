class Cut < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :animal
  belongs_to :primal_cut
  belongs_to :favorite

  attr_accessible :name

  validates :name, :presence => true
end
