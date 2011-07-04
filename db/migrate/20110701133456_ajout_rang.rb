class AjoutRang < ActiveRecord::Migration
  def self.up
    change_table :notes do |t|
      t.integer :rang
    end
  end

  def self.down
    remove_column(:notes, :rang)
  end
end
