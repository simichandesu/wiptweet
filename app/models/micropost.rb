class Micropost < ActiveRecord::Base
  belongs_to :organization
  validates :organization_id, presence: true
end