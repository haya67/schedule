class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  validate :start_end_check
  validates :title, presence: true

  def start_end_check
    if self.finish < self.start
     errors.add(:finish, "は開始日より前の日付は登録できません。")  
    end
  end
end
