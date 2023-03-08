class User < ApplicationRecord
  has_and_belongs_to_many :interests
  has_and_belongs_to_many :skills

  validates :email, uniqueness: true
  validates :age, numericality: { in: 0..90 }
  validates :gender, inclusion: { in: %w(male female) }
end