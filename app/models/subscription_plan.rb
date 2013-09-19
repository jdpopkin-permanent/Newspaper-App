class SubscriptionPlan < ActiveRecord::Base
  attr_accessible :daily, :price, :newspaper_id, :dailiness

  validates :price, presence: true
  validates :newspaper_id, presence: true
  validates :daily, inclusion: { in: [true, false] }

  belongs_to :newspaper, class_name: "Newspaper", primary_key: :id,
  foreign_key: :newspaper_id

  def dailiness=(num)
    num == 0 ? self.daily = false : self.daily = true
  end
end
