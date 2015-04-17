class Page < ActiveRecord::Base
  belongs_to :project
  has_attached_file :image, styles: { :medium => "640x1136>", :thumb => "80x142>" }
  validates_attachment_content_type :image, :content_type => /^image\/(png|gif|jpeg|jpg)/
end
