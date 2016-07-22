class Transport < ActiveRecord::Base
    belongs_to :user
    
    has_attached_file :picture, styles: { medium: "300x300>", small: "180x180>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
