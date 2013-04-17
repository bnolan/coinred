class Vote < ActiveRecord::Base
  attr_accessible :direction, :post_id
  validates :direction, :inclusion => { :in => -1..1 }
end
