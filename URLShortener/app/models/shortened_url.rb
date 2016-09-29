class ShortenedUrl < ActiveRecord::Base
  validates :short_url, :presence => true, :uniqueness => true
  validates :long_url, :presence => true
  validates :user_id, :presence => true

  belongs_to :user,
    :class_name => "User",
    :primary_key => :id,
    :foreign_key => :user_id

  has_many :visits,
    class_name: :Visit,
    primary_key: :id,
    foreign_key: :url_id

  has_many :visitors, -> { distinct }, :through => :visits, :source => :user

  def self.random_code
    code = SecureRandom.base64(12)
    while ShortenedUrl.exists?(short_url: code)
      code = SecureRandom.base64(12)
    end
    code
  end

  def num_clicks
    visits.count
  end

  def num_uniques
    visitors.distinct.count
  end

  def num_unique_recent
    visits.select('user_id').where("created_at > ?", 1.minute.ago).distinct.count
  end


  def self.create_for_user_and_long_url!(user, long_url)
    id = user.id
    code = ShortenedUrl.random_code
    ShortenedUrl.create(long_url: long_url, short_url: code, :user_id => id)
  end
end
