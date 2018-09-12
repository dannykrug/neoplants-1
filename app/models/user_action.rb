class UserAction < ApplicationRecord
  belongs_to :user
  belongs_to :action
  #make sure this works
  validates_uniqueness_of :user_id, :scope => :action_id
end
