class Like < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  # likes will have validations on listings so that they are destroyed when listings are destroyed
  #  and not orphaned 

end
