class TagTopic < ActiveRecord::Base
  validates :tag_name, :presence => true, :uniqueness => true

  has_many :taggings,
    class_name: :Tagging,
    primary_key: :id,
    foreign_key: :tag_id

  has_many :urls, -> { distinct }, :through => :taggings, :source => :shortened_url

end
