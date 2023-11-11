class PostImage < ApplicationRecord
  
    has_one_attached :image   # 1対１(単数枚画像投稿)で関連付けるという宣言
    belongs_to :user
    has_many :post_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    
    validates :shop_name, presence: true
    validates :image, presence: true
    
    
    def get_image
      unless image.attached?
        file_path = Rails.root.join('app/assets/images/no_image.jpg')
        image.attach(io: File.open(file_path),filename:'default-image.jpg', content_type: 'image/jpg')
      end
      image
    end
    
    def favorited_by?(user)
      favorites.exists?(user_id: user.id)
    end 
    
end
