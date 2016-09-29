class Visit < ActiveRecord::Base
  validates :user_id, presence: true
  validates :url_id, presence: true

  def self.record_visit!(user, shortened_url)
    id = user.id
    url_id = shortened_url.id
    Visit.create(user_id: id, url_id: url_id)
  end

  belongs_to :user,
    class_name: :User,
    foreign_key: :user_id,
    primary_key: :id

  belongs_to :ShortenedUrl,
    class_name: :ShortenedUrl,
    foreign_key: :url_id,
    primary_key: :id

end
