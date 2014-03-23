class Manuscript < ActiveRecord::Base
  belongs_to :caption, :counter_cache=>true
  belongs_to :user
end
