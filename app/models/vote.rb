class Vote < ActiveRecord::Base
  attr_accessible :direction, :post_id
  validates :direction, :inclusion => { :in => -1..1 }
  validates_uniqueness_of :user_id, :scope => :post_id

  belongs_to :user
  belongs_to :post
end
