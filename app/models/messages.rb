class Messages < ActiveRecord::Base
  belongs_to :user
  belongs_to :conversation
  attr_accessible :body
end
