class Caption < ActiveRecord::Base
  belongs_to :video
  has_many :manuscripts
  has_many :users, through: :manuscripts
end
