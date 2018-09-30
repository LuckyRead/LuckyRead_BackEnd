class AddResponseCommentRelation < ActiveRecord::Migration[5.2]
  def change
    change_column :responses, :comment_idcoment, :integer, :has_one :comment
  end
end
