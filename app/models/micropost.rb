class Micropost < ActiveRecord::Base
  belongs_to :organization
  default_scope -> { order(published: :desc) }
end
