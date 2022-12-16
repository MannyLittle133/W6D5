# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
  validates :id, :birth_date, :color, :name, :sex, presence: true
  CAT_COLORS = [:orange, :black, :white, :blue, :grey, :green, :yellow, :brown]
  SEX = [:M, :F]
  def inclusion
    if !CAT_COLORS.include?(color)
      errors.add(:color, 'color not presence')
    end

    if !SEX.include(sex)
      errors.add(:sex, 'must choose M or F')
    end
  end

  def birth_date_cannot_be_future
    if Date.parse(birth_date, '%Y-%m-%d')  > Date.today
      errors.add(:birth_date, 'not a valid date')
    end
  end

  
end
