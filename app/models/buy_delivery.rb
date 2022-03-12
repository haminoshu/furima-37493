class BuyDelivery
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :post_code
    validates :prefecture_id
    validates :municipality
    validates :address
    validates :phone_number
  end

  validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is not a number. Include hyphen(-)' }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :phone_number,
            format: { with: /\A\d{10,11}\z/, greater_than_or_equal_to: 10, less_than_or_equal_to: 11,
                      message: 'is not a number.Phone number must be greater than or equal to 10, or must be less than or equal to 11' }

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)

    Delivery.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address,
                    building: building, phone_number: phone_number, buy_id: buy.id)
  end
end
