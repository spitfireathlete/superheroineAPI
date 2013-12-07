object @card
attributes :id, :name, :display_name, :title, :bio, :facts, :advice, :goals, :quotes, :num_shares, :num_favorites, :isFav, :created_at, :updated_at, :twitter_handle

child :superheroine do
        attributes :id, :name, :display_name, :bio, :created_at, :image, :updated_at
		
		child :superpowers, :object_root => false do
			attributes :name, :description
		end		
end

child :heroine_videos, :object_root => false do
        attributes :video_link
end

node(:image) {@image_url} 

node(:isFav) { @isFav }