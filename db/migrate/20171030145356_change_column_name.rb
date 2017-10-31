class ChangeColumnName < ActiveRecord::Migration[5.1]

  def self.up
    if column_exists? :restaurants, :pic_url
      remove_column :restaurants, :pic_url
    end
    change_table :restaurants do |t|
      t.attachment :image
    end
  end
end
