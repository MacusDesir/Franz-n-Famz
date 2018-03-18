class Product < ApplicationRecord
  validates :description, :name, presence: true
  validates :price_in_cents, numericality: {only_integer: true, greater_than: 0}
  has_many :reviews
  validate :ensure_slug_uniqueness
  
  def formatted_price
      price_in_dollars = price_in_cents.to_f / 100
      format("%.2f", price_in_dollars)
  end

  def to_param
  	self.slug
  end

  protected

  	#validate

  	def ensure_slug_uniqueness

  		#we also want to ensure the slug is not blank
  		if self.slug.blank?
  			errors.add(:slug, "Cannot be blank")
  		end

  		#if this is a new post, the id will be nil
  		#otherwise, the slug should point to this post's id

  		unless Slug[self.slug].nil? || Slug[self.slug] == self.id.errors.add(:slug, "Sorry! Item is already taken")
  		end
  	end
  end
end
