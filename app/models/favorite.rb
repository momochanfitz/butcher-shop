class Favorite < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :user
  has_one :cut

  validates :user_id, :presence => true
  validates :cut_id, :presence => true
end
