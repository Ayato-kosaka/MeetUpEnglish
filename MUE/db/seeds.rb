# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'csv'
# savePath = 'public/KEN_ALL.CSV'
# CSVROW_PREFKANA = 3
# CSVROW_CITYKANA = 4
# CSVROW_PREFNAME = 6
# CSVROW_CITYNAME = 7
# CSV.foreach(savePath, encoding: "Shift_JIS:UTF-8") do |row|
# 	prefName = row[CSVROW_PREFNAME]
#   prefKana = row[CSVROW_PREFKANA]
# 	cityName = row[CSVROW_CITYNAME]
#   cityKana = row[CSVROW_CITYKANA]
#   pref = Prefecture.find_or_create_by(:name => prefName, :kana => prefKana)
#   pref.cities.find_or_create_by(:name => cityName, :kana => cityKana)
# end
#
# savePath = 'public/line20190928free.csv'
# CSVROW_CD = 0
# CSVROW_KANA = 3
# CSVROW_L_NAME = 4
# CSV.foreach(savePath) do |row|
# 	lineCd = row[CSVROW_CD]
#   lineKana = row[CSVROW_KANA]
# 	lineName = row[CSVROW_L_NAME]
#   Line.create(:cd => lineCd, :kana => lineKana, :name => lineName)
# end
#
# savePath = 'public/station20190928free.csv'
# CSVROW_NAME = 2
# CSVROW_LON = 9
# CSVROW_LAT = 10
# CSVROW_LINE = 5
# CSVROW_PRE = 6
# CSV.foreach(savePath) do |row|
# 	sta_name = row[CSVROW_NAME]
#   sta_latitude = row[CSVROW_LAT]
# 	sta_longitude = row[CSVROW_LON]
#   puts row[CSVROW_LINE] unless (line = Line.find_by(cd: row[CSVROW_LINE]))
#   next unless (line = Line.find_by(cd: row[CSVROW_LINE]))
#   station = Station.find_or_create_by(:name => sta_name, :latitude => sta_latitude, :longitude => sta_longitude)
#   line.line_stations.create(station_id: station.id)
#   line.prefecture_lines.find_or_create_by(prefecture_id: row[CSVROW_PRE])
# end
#
# class String
#   def &(str)
#     k = $KCODE
#     $KCODE='u'
#     a = self.split(//).zip(str.split(//)).map{ |e| e.uniq.size==1 }
#     idx = a.index(false)
#     return "" if idx == nil
#     return self[0...idx]
#     $KCODE= k
#   end
# end
# def setdouble(prefecture_id)
# 	cities = Prefecture.find(prefecture_id).cities
# 	cities.each_cons(2) do |current_val, next_val|
# 		common = current_val.name&next_val.name
# 		if (common.length>1 && ["市", "郡"].include?(common[-1]))
# 			next_val.update(double: common)
# 			current_val.update(double: common) if common.length > current_val.double.to_s.length
# 		end
# 	end
# end
# Prefecture.all.each{|n|setdouble(n.id)}
#
# City.where.not(double: nil).pluck(:double).group_by{ |e| e }.select { |k, v| v.size < 3 }.keys.each do |double|
# 	City.where(double: double).each{|city|city.update(double: nil)}
# end

# Prefecture.find_by(name: "北海道").update(region_id: 1)
# Prefecture.find_by(name: "青森県").update(region_id: 2)
# Prefecture.find_by(name: "岩手県").update(region_id: 2)
# Prefecture.find_by(name: "宮城県").update(region_id: 2)
# Prefecture.find_by(name: "秋田県").update(region_id: 2)
# Prefecture.find_by(name: "山形県").update(region_id: 2)
# Prefecture.find_by(name: "福島県").update(region_id: 2)
# Prefecture.find_by(name: "茨城県").update(region_id: 3)
# Prefecture.find_by(name: "栃木県").update(region_id: 3)
# Prefecture.find_by(name: "群馬県").update(region_id: 3)
# Prefecture.find_by(name: "埼玉県").update(region_id: 3)
# Prefecture.find_by(name: "千葉県").update(region_id: 3)
# Prefecture.find_by(name: "東京都").update(region_id: 3)
# Prefecture.find_by(name: "神奈川県").update(region_id: 3)
# Prefecture.find_by(name: "新潟県").update(region_id: 4)
# Prefecture.find_by(name: "富山県").update(region_id: 4)
# Prefecture.find_by(name: "石川県").update(region_id: 4)
# Prefecture.find_by(name: "福井県").update(region_id: 4)
# Prefecture.find_by(name: "山梨県").update(region_id: 4)
# Prefecture.find_by(name: "長野県").update(region_id: 4)
# Prefecture.find_by(name: "岐阜県").update(region_id: 4)
# Prefecture.find_by(name: "静岡県").update(region_id: 4)
# Prefecture.find_by(name: "愛知県").update(region_id: 4)
# Prefecture.find_by(name: "三重県").update(region_id: 5)
# Prefecture.find_by(name: "滋賀県").update(region_id: 5)
# Prefecture.find_by(name: "京都府").update(region_id: 5)
# Prefecture.find_by(name: "大阪府").update(region_id: 5)
# Prefecture.find_by(name: "兵庫県").update(region_id: 5)
# Prefecture.find_by(name: "奈良県").update(region_id: 5)
# Prefecture.find_by(name: "和歌山県").update(region_id: 5)
# Prefecture.find_by(name: "鳥取県").update(region_id: 6)
# Prefecture.find_by(name: "島根県").update(region_id: 6)
# Prefecture.find_by(name: "岡山県").update(region_id: 6)
# Prefecture.find_by(name: "広島県").update(region_id: 6)
# Prefecture.find_by(name: "山口県").update(region_id: 6)
# Prefecture.find_by(name: "徳島県").update(region_id: 7)
# Prefecture.find_by(name: "香川県").update(region_id: 7)
# Prefecture.find_by(name: "愛媛県").update(region_id: 7)
# Prefecture.find_by(name: "高知県").update(region_id: 7)
# Prefecture.find_by(name: "福岡県").update(region_id: 8)
# Prefecture.find_by(name: "佐賀県").update(region_id: 8)
# Prefecture.find_by(name: "長崎県").update(region_id: 8)
# Prefecture.find_by(name: "熊本県").update(region_id: 8)
# Prefecture.find_by(name: "大分県").update(region_id: 8)
# Prefecture.find_by(name: "宮崎県").update(region_id: 8)
# Prefecture.find_by(name: "鹿児島県").update(region_id: 8)
# Prefecture.find_by(name: "沖縄県").update(region_id: 8)
