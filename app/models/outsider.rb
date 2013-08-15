class Outsider < User
  has_many :conversations
  has_many :insiders, through: :conversations
end
