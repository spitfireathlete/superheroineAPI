class CreateSuperheroinePowers < ActiveRecord::Migration
  def change
    create_table :superheroine_powers do |t|
      t.references :superheroine, index: true
      t.references :superpower, index: true
      t.timestamps
    end
  end
end
