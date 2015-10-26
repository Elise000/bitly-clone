class AddIndexToUrls < ActiveRecord::Migration
  def change
    add_index :urls, :shorten_url
  end
end