class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true

  has_many :urls,
    :class_name => "ShortenedUrl",
    :primary_key => :id,
    :foreign_key => :user_id

  has_many :visits,
    class_name: :Visit,
    primary_key: :id,
    foreign_key: :user_id

  has_many :visited_urls, -> { distinct }, :through => :visits, :source => :ShortenedUrl

end
