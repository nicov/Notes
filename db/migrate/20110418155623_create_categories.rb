class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :nom
      t.references :categorie

      t.timestamps
    end

    change_table :notes do |t|
      t.references :categorie
    end
  end

  def self.down
    drop_table :categories

    remove_column :categorie, :notes
  end
end
