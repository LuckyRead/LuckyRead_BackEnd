class ChageNameSubTopicsToSubtopic < ActiveRecord::Migration[5.2]
  def change
    rename_table :sub_topics, :sub_topic
  end
end
