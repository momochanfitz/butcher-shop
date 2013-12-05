require 'spec_helper'

describe Favorite do
  it { should validate_presence_of :name }
  it { should validate_presence_of :cut }
  it { should have_one :cut }
  it { should belong_to :user }
end