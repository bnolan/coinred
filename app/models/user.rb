class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :name, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :posts
  has_many :votes

  def karma
  	Vote.where(:post_id => posts.collect(&:id)).sum('direction')
  end

  def bitcoin_worth
  	karma / 1000.0
  end

end
