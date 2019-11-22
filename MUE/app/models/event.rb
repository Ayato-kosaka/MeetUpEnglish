class CorrectTimeValidator < ActiveModel::Validator
  def validate(record)
    # if record.start > record.end
    #   record.errors[:cafe] << 'start time is before finish time'
    # end
  end
end

class Event < ApplicationRecord
  include ActiveModel::Validations
  has_many :contacts, dependent: :nullify
  has_many :user_events
  has_many :users, through: :user_events
  #belongs_to :cafe
  belongs_to :place
  belongs_to :teacher
  #belongs_to :city

  validates_with CorrectTimeValidator

  after_find do |event|
    #スタート時間を過ぎてて、終了チェックがついてない
    if !event.finished && (Time.zone.parse(event.date.strftime("%Y%m%d")+event.start.strftime("%H%M")) < ( current = Time.current ))
      if Time.zone.parse(event.date.strftime("%Y%m%d")+event.end.strftime("%H%M")) < current
        event.update(finished: true, realtime: false)
      elsif !event.realtime
        event.update(finished: false, realtime: true)
      end
    end
  end

  def resort_user_events_to_sheet
    events = self.user_events.sort{|x,y|x.start<=>y.start}
    [0...self.peopleNum].each do |num|
      break if events.empty?
      t_event = events.shift
      t_event.update(sheet: num)
			t_event.update(sheet: num) while (t_event = events.delete(events.find{|n|n.start>=t_event.end}))
    end
  end
  def no_space? user_event
    sheets_num = self.peopleNum
    start = self.start
    time_num = (self.end - start)/60
    sheets_mat = [0...sheets_num].map do |sheet_num| #(sheets_num*time_num):bool
      event_bool = Array.new(time_num,false)
      self.user_events.where(sheet: sheet_num).each do |n_user_event| #make sheet space on bool
    		((n_user_event.start-start)/60...(n_user_event.end-start)/60).each do |n|
    			event_bool[n] = true
    		end
      end
    end
    space = sheets_mat.transpose.map{ |m|m.inject(true){|ans,ret|ans && ret} }
    user_event_bool = Array.new(time_num,false)
    ((user_event.start-start)/60...(user_event.end-start)/60).each do |n|
      user_event_bool[n] = true
    end
    space.map.with_index { |m, index| m&&user_event_bool[index] }.inject(false){|ans,ret|ans || ret}
  end

  def to_key
    [Base64.encode64(id.to_s)]
  end

  def to_param
    Base64.encode64(id.to_s)
  end
end

__END__

t.integer "city_id"
t.date "date"
t.time "start"
t.time "end"
t.integer "peopleNum"
t.integer "teacher_id"
t.integer "cafe_id"
t.datetime "created_at", null: false
t.datetime "updated_at", null: false
t.string "title"
t.integer "fee"
t.boolean "finished", default: false
t.boolean "realtime", default: false
