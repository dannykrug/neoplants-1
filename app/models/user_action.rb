class UserAction < ApplicationRecord
  belongs_to :user
  belongs_to :action
  validates_uniqueness_of :user_id, :scope => :action_id
end
