require 'spec_helper'

describe Favorite do
  it { should be_a_kind_of ActiveModel::ForbiddenAttributesProtection }
  it { should validate_presence_of :name }

  it { should have_one :cut }
  it { should belong_to :user }
end