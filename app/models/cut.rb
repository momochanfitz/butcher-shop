class Cut < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  belongs_to :animal
  belongs_to :primal_cut
  has_many :favorites

  validates :name, :presence => true
end
