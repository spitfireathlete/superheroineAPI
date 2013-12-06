object @card
attributes :id, :name, :display_name, :title, :bio, :facts, :advice, :goals, :created_at, :updated_at

child :superheroine do
        attributes :id, :name, :display_name, :bio, :created_at, :updated_at
		
		child :superpowers, :object_root => false do
			attributes :name, :description
		end		
end

child :heroine_videos, :object_root => false do
        attributes :video_link
end