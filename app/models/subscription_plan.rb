class SubscriptionPlan < ActiveRecord::Base
  attr_accessible :daily, :price, :newspaper_id, :dailiness

  validates :price, presence: true
  validates :newspaper_id, presence: true # is this wrong?
  validates :daily, inclusion: { in: [true, false] }

  belongs_to :newspaper, class_name: "Newspaper", primary_key: :id,
  foreign_key: :newspaper_id

  # not needed; database will parse string "true" as true when
  # sent to a boolean column
  def dailiness=(num)
    num == 0 ? self.daily = false : self.daily = true
  end
end
