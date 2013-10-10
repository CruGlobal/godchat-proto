class Comment < ActiveRecord::Base
  belongs_to :outsider
  belongs_to :insider
  #attr_accessible :body
end
