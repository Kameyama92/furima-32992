class UserDelivery
  
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number, :price, :user_id, :item_id, :item_delivery_id, :token
  
  with_options presence: true do
     validates :municipalities
     validates :address
     validates :phone_number, length: { maximum: 11 }
     validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Postal code Input correctly' }
     validates :token
   end

   validates :prefecture_id, numericality: { other_than: 1, message: 'Select' } 
   validates :phone_number, numericality: { only_integer: true, message: 'Input only number' }
   
  def save
    ItemDelivery.create(user_id: user_id, item_id: item_id,)
    Delivery.create(postal_code: postal_code, municipalities: municipalities, address: address, building_name: building_name, phone_number: phone_number, item_delivery_id: item_delivery_id)
  end
end