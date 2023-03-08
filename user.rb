class User < ApplicationRecord
  has_many :interests
  has_many :skills

  validates :email, uniqueness: true
  validates :age, numericality: { in: 0..90 }
  validates :gender, inclusion: { in: %w(male female) }
end