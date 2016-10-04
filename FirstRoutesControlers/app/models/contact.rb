require 'byebug'
class Contact < ActiveRecord::Base
  validates :email, presence: true
  validates_uniqueness_of :email, scope: :user_id
  validates :name, presence: true
  validates :user_id, presence: true
  # validate :detect_duplicate_email

  belongs_to :user,
    class_name: :User,
    foreign_key: :user_id,
    primary_key: :id

  has_many :contact_shares,
    class_name: :ContactShare,
    foreign_key: :contact_id,
    primary_key: :id

  has_many :shared_users,
    through: :contact_shares,
    source: :user

  # def detect_duplicate_email
  #   # byebug
  #   return true if self.user_id.nil? || self.email.nil? || self.user.nil?
  #   if get_sibling_contacts.empty?
  #     return true
  #   else
  #     self.errors[:email] << "cant be present twice in one contact list"
  #     return false
  #   end
  # end

  # private
  # def get_sibling_contacts
  #   return [] if self.user.nil?
  #   self.user.contacts.where(email: self.email).
  #   where.not(id: self.id)
  #
  #
  # end
end
