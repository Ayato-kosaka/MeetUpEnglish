class HasSapceValidator < ActiveModel::Validator
  def validate(record)
    if record.new_record? && (record.event.no_space? record)
      record.errors[:cafe] << 'ただいま、その時間は空いておりません。'
    end
  end
end

class UserEvent < ApplicationRecord
  include ActiveModel::Validations
  belongs_to :user
  belongs_to :event

  validates_with HasSapceValidator

  #before_saveにすると、無限ループが起こるから、before_createにして、updateをそもそもできずに、destroy->createにする
  #もし失敗したらhelperで実装して、controllerでやるのも手
  after_create do |user_event|
    user_event.event.resort_user_events_to_sheet
  end
end
