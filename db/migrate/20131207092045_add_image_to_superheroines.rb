class AddImageToSuperheroines < ActiveRecord::Migration
  def change
    add_column :superheroines, :image, :string
  end
end
