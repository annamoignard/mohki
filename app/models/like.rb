class Like < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  # association is only half set up - is this right? 
  
end
