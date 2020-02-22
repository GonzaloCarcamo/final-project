class CreateAds < ActiveRecord::Migration[5.2]
  def change
    create_table :ads do |t|
      t.string :title
      t.string :category
      t.string :tag
      t.timestamps
    end
  end
end
