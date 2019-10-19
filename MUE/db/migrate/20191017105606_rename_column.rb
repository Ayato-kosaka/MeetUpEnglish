class RenameColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :blogcomments, :blogId, :blog_id
    rename_column :caves, :cityId, :city_id
    rename_column :cities, :prefectureId, :prefecture_id
    rename_column :events, :cityId, :city_id
    rename_column :events, :teacherId, :teacher_id
    rename_column :events, :cafeId, :cafe_id
    rename_column :prefectures, :regionId, :region_id
    rename_column :sections, :blogId, :blog_id
  end
end
