class Questionnaire
  def self.category_for(number)
    case number
    when 0,4,8; 'Pop'
    when 1,5,9; 'Science'
    when 2,6,10; 'Sports'
    else
      'Rock'
    end
  end
end
