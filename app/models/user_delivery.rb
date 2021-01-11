class UserDelivery
  
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number, :price, :user_id, :item_id
  
  with_options presence: true do
     validates :municipalities
     validates :address
     validates :phone_number
     validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Postal code Input correctly' }
   end

   validates :prefecture_id, numericality: { other_than: 1, message: 'Select' } 
   validates :phone_number, numericality: { only_integer: true, less_than: 10000000, message: 'Input only number' }
   
  def save
    Delivery.create(postal_code: postal_code, municipalities: municipalities, address: address, building_name: building_name, phone_number: phone_number,)
    ItemDelivery.create(user_id: user_id, item_id: item_id)
  end
end