class Comment < ActiveRecord::Base
  belongs_to :outsider
  belongs_to :operator
  #attr_accessible :body
end
