class Post < ActiveRecord::Base
	require 'open-uri'
	require 'cgi'

  validates_uniqueness_of :url
  validates_presence_of :url, :user_id

  attr_accessible :title, :body, :url
  serialize :embed, JSON
  before_save :set_embed
  has_many :votes
  after_create :create_vote
  belongs_to :user

  def karma
  	votes.sum('direction')
  end

  def embed_html
  	self.embed['html'] rescue nil
  end

  def embed_image_url
  	if self.embed.present? and self.embed['url'].present? and self.embed['url'].match(/(jpg|jpeg|png|gif)$/)
  		self.embed['url']
  	end
  end

	def embed_height
		if self.embed.present? and self.embed['height'].present?
			ratio = 1.0 / self.embed['width'].to_i * 380.0
			self.embed['height'].to_f * ratio
		end

	end

  protected

  def create_vote
    # lets assume they'll vote for themselves lolol
    user.votes.create! :post_id => id, :direction => 1
  end

  def set_embed
  	if self.embed.blank? and self.embed = JSON.parse(open(embedly_url) {|f| f.read } )
  		self.title = self.embed['title']
  	end
  end

  def embedly_url
  	key = "90eb0b46c1e146e5afbbe0279e77866b"
  	"http://api.embed.ly/1/oembed?key=#{key}&url=#{CGI.escape(url)}&maxwidth=380&maxheight=480&format=json"
  end
end
	