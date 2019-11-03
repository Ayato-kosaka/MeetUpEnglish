class Event < ApplicationRecord
  has_many :contacts, dependent: :nullify
  belongs_to :cafe
  belongs_to :place
  belongs_to :teacher
  belongs_to :city


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

  def to_key
    [Base64.encode64(id.to_s)]
  end

  def to_param
    Base64.encode64(id.to_s)
  end
end
