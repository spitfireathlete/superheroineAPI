object @superheroine
attributes :id, :name, :display_name, :bio, :image, :created_at, :updated_at

		
	child :superpowers, :object_root => false do
		attributes :name, :description
	end		