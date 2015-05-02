class Page < ActiveRecord::Base
  belongs_to :project
  has_many :widgets
  
  mount_uploader :image, ImageUploader
end
