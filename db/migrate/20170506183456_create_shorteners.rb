class CreateShorteners < ActiveRecord::Migration[5.0]
  def change
    create_table :shorteners do |t|
      t.string :original_url
      t.string :shortened_url

      t.timestamps
    end
  end
end
