class Spot < ApplicationRecord
  STATUSES = %w[draft active archived].freeze

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, :city, :state, presence: true
  validates :status, inclusion: { in: STATUSES }
end
