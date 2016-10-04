class ContactShare < ActiveRecord::Base
  validates :user_id, presence: true
  validates :contact_id, presence: true
  validates_uniqueness_of :contact_id, scope: :user_id

  belongs_to :user,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

  belongs_to :contact,
    class_name: :Contact,
    primary_key: :id,
    foreign_key: :contact_id
end
