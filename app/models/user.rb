class User < ApplicationRecord
validate :start_end_check
validates :title, presence: true
validates :title, length: { maximum: 20 }

def start_end_check
    if self.finish < self.start
      errors.add(:finish, "は開始日より前の日付は登録できません。")  
    end
    end

end
