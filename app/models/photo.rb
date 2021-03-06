class Photo < ActiveRecord::Base
  acts_as_votable
  belongs_to :user

  validates :description, length: {maximum: 140}

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100", large: "866x683#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
