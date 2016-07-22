class Order < ActiveRecord::Base
    belongs_to :category
    belongs_to :user
    has_many :bids
    has_many :comments
    
    has_attached_file :cargo_picture, styles: { medium: "300x300>", small: "180x180>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :cargo_picture, content_type: /\Aimage\/.*\Z/
    
    def volume_with_details
        volume = width * height * length
        "#{volume} (#{width} x #{height} x #{length})"
    end
    
    def other
        "#(#{order.id})"
    end
    
    def to_param
      "#{id} #{category.slug} #{Translit.convert(what, :english)}".parameterize
    end
    
end
