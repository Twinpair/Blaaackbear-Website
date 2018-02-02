class Photo < ApplicationRecord

  belongs_to :album

  # Default order is set by services order_listed attribute 
  default_scope -> { order(order_listed: :asc) }
  mount_uploader :image, PhotoUploader
  validates :image, presence: true

  def self.increment_order(id, order_listed, album_id)
    Photo.where("album_id = ? AND order_listed >= ? AND id != ?", album_id, order_listed, id).update_all("order_listed = order_listed + 1")
  end

  def self.decrement_order(id, order_listed, album_id)
    Photo.where("album_id = ? AND order_listed > ? AND id != ?", album_id, order_listed, id).update_all("order_listed = order_listed - 1")
  end

end
