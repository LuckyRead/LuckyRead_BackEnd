class AddScoreToPreference < ActiveRecord::Migration[5.2]
  def change
    add_column :preference, :score, :integer, :default => 0
    add_column :comments, :date, :datetime, :null => false
  end
end
