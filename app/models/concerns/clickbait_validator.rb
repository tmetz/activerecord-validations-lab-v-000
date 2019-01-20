class ClickbaitValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    phrase_array = ["Won't Believe", "Secret", "Top /[0-9]/", "Guess"]
    if phrase_array.any? {|phrase| value.to_s.include?(phrase)}
      return true
    else
      record.errors[attribute] << "Title needs to be clickbait"
    end
  end
end

# solution from Flatiron:
# CLICKBAIT_PATTERNS = [
#     /Won't Believe/i,
#     /Secret/i,
#     /Top [0-9]*/i,
#     /Guess/i
#   ]
# 
#   def is_clickbait?
#     if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
#       errors.add(:title, "must be clickbait")
#     end
#   end
