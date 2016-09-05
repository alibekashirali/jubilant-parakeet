class Specialization < ActiveRecord::Base
    validates_presence_of :user_id, :category_id
    validates :user_id, uniqueness: { scope: :category_id }
    
    belongs_to :user
    belongs_to :category
end
