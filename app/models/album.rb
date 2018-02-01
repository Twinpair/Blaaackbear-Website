class Album < ApplicationRecord

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  has_many :photos, dependent: :destroy

  # Default order is set by services order_listed attribute 
  default_scope -> { order(order_listed: :asc) }
  mount_uploader :cover_image, AlbumUploader
  validates :name, presence: true, uniqueness: true
  validates :cover_image, presence: true

  def self.increment_order(id, order_listed)
    Album.where("order_listed >= ? AND id != ?", order_listed, id).update_all("order_listed = order_listed + 1")
  end

  def self.decrement_order(id, order_listed)
    Album.where("order_listed > ? AND id != ?", order_listed, id).update_all("order_listed = order_listed - 1")
  end

end
