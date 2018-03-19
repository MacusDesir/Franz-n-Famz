class Slug
	belongs_to :users
	class << self

		def [](slug)
			redis.hget(hash, slug)
		end

		def []=(slug, id)
			if old = self[slug]
				redis.srem(set(old), slug)
		end
			redis.hset(hash, slug, id)
			redis.sadd(set(id), slug)
		end

		def destroy(id)
			redis.smembers(set(id)).each { |slug| redis.hdel(hash, slug) }
			redis.del(set(id))
		end

	private

		def redis
			$redis
		end

		def hash
			"product_ids"
		end

		def set(id)
			"product_slugs_#{id}"
		end
	end
end

class PostObserver

	def after_save(product)
		Slug[post.slug] = product.id.to_s
		return true
	end

	def afer_destroy(product)
		Slug.destroy(product.id)
		return true
	end
end
