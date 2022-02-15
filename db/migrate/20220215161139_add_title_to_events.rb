class AddTitleToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :title, :string, null:false, default: 'Game Night!'
  end
end
