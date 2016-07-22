class Category < ActiveRecord::Base
    has_many :orders
    
    extend FriendlyId
    friendly_id :custom_slug, use: :slugged
    
    validates :name, presence: true, uniqueness: true
    
    def custom_slug
        Translit.convert(name, :english).parameterize
    end
end
