class Favorite < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :user
  has_one :cut

  attr_accessible :user_id, :name

  validates :name, :presence => true
  validates :user_id, :presence => true
end
