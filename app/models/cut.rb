class Cut < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :animal
end
