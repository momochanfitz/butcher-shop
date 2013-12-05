class Favorite < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :user
  has_one :cut

  validates :cut_id, :presence => true
  validates :user_id, :presence => true
end
