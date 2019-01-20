class ClickbaitValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    phrase_array = ["Won't Believe", "Secret", "Top", "Guess"]
    if phrase_array.any? {|phrase| value.to_s.include?(phrase)}
      return true
    else
      record.errors[attribute] << "Title needs to be clickbait"
    end
  end
end
