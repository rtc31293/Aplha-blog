class AddUserIdToArticles < ActiveRecord::Migration
  belongs_to :user
  def change
    add_column :articles, :user_id, :integer
  end
end
