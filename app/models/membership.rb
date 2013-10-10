class Membership < ActiveRecord::Base
  belongs_to :users
  belongs_to :organizations
  #attr_accessible :valid, :admin, :owner
end
