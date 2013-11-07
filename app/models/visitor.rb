class Visitor < ActiveRecord::Base
  has_many :conversations
  has_many :insiders, through: :conversations
end
