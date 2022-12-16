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
    validate :birth_date, :birth_date_cannot_be_future
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
        if birth_date > Date.today
            errors.add(:birth_date, 'not a valid date')
        end

        
        # if birth_date.year > Date.today.year
        #     errors.add(:birth_date, “Not a real date”)
        # end
        
        # if birth_date.year == Date.today.year
        #     if birth_date.mon > Date.today.month
        #         errors.add(:birth_date, “Not a real date”)
        #     end
        #     if birth_day.mon == Date.today.mon
        #         if birth_date.day > Date.today.day
        #             errors.add(:birth_date, “Not a real date”)
        #         end
        #     end
        # end
    end

    def age
        Date.today.year - birth_date.year
    end

    


end
