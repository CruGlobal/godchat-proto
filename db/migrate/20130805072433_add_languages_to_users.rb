class AddLanguagesToUsers < ActiveRecord::Migration
  def change
    create_table :users_languages do |t|
      t.belongs_to :user
      t.belongs_to :language
    end
  end
end
