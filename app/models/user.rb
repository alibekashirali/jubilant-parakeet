class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_attached_file :avatar, styles: { medium: "300x300>", small: "180x180>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  
  has_many :transports
  has_many :comments
  has_many :orders
  has_many :specializations
  has_many :categories, through: :specializations
  has_many :relevant_orders, through: :categories, source: :orders
  
  def specialization_of(category)
    specializations.where(category_id: category.id).first
  end
end
