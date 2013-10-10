class Languages < ActiveRecord::Base
  #attr_accessible :locale, :name

  has_and_belongs_to_many :users
end
