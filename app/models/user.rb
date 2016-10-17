class User < ActiveRecord::Base
  #emailを保存前に小文字
  before_save { self.email = self.email.downcase }
  # nameを50文字に制限
  validates :name, presence: true, length: { maximum: 50 }
  #email正規表現パターン
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #email255文字以内正規表現パターン一致
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
end
