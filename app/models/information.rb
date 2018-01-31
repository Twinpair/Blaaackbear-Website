class Information < ApplicationRecord

  mount_uploader :banner_image, InformationUploader
  mount_uploader :about_image, InformationUploader
  mount_uploader :contact_image, InformationUploader


end
