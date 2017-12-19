class Order < ApplicationRecord
  belongs_to :user
  has_many :product_lists

  validates :billing_name, presence: true
  validates :billing_address, presence: true
  validates :shipping_name, presence: true
  validates :shipping_address, presence: true

  before_create :generate_token

  include AASM

  aasm column: :state do
    state :pending, initial: true
    state :paid, :shipping, :delivered, :returened, :refunded

    event :make_payment do
      transitions from: :pending, to: :paid
    end

    event :ship do
      transitions from: :paid, to: :shipping
    end

    event :delivering do
      transitions from: :shipping, to: :delivered
    end

    event :return do
      transitions from: [:shipping, :delivered], to: :returened
    end

    event :refund do
      transitions from: [:paid, :returened], to: :refunded
    end
  end

  def generate_token
    self.token = SecureRandom.uuid
  end

  def set_payment_with!(method)
    self.update_columns(payment_method: method)
  end

  def pay!
    self.update_columns(is_paid: true)
  end
end
