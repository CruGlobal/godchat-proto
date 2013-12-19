class Comment < ActiveRecord::Base
  belongs_to :outsider
  belongs_to :operators
  #attr_accessible :body
end
