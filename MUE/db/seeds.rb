# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'csv'
savePath = 'D:\Profile\Downloads\ken_all\KEN_ALL.CSV'
CSVROW_PREFKANA = 3
CSVROW_CITYKANA = 4
CSVROW_PREFNAME = 6
CSVROW_CITYNAME = 7
CSV.foreach(savePath, encoding: "Shift_JIS:UTF-8") do |row|
	prefName = row[CSVROW_PREFNAME]
  prefKana = row[CSVROW_PREFKANA]
	cityName = row[CSVROW_CITYNAME]
  cityKana = row[CSVROW_CITYKANA]
  pref = Prefecture.find_or_create_by(:name => prefName, :kana => prefKana)
  pref.cities.find_or_create_by(:name => cityName, :kana => cityKana)
end

class String
  def &(str)
    k = $KCODE
    $KCODE='u'
    a = self.split(//).zip(str.split(//)).map{ |e| e.uniq.size==1 }
    idx = a.index(false)
    return "" if idx == nil
    return self[0...idx]
    $KCODE= k
  end
end
def setdouble(prefecture_id)
	cities = Prefecture.find(prefecture_id).cities
	cities.each_cons(2) do |current_val, next_val|
		common = current_val.name&next_val.name
		if (common.length>1 && ["市", "郡"].include?(common[-1]))
			next_val.update(double: common)
			current_val.update(double: common) if common.length > current_val.double.to_s.length
		end
	end
end
Prefecture.all.each{|n|setdouble(n.id)}

City.where.not(double: nil).pluck(:double).group_by{ |e| e }.select { |k, v| v.size < 3 }.keys.each do |double|
	City.where(double: double).each{|city|city.update(double: nil)}
end
