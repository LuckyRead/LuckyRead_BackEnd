class FragmentSerializer < ActiveModel::Serializer
    attributes :id, :title, :introduction, :content, :score, :source, :users_id, :photos_id
end