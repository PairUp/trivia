class Questionnaire
  CATEGORIES = %w(Pop Science Sports Rock)
  def initialize
    @questions = {}
    CATEGORIES.each do |cat|
      50.times do |num|
        @questions[cat] ||= []
        @questions[cat] << "#{cat} Question #{num}"
      end
    end
  end

  def next_question(cat)
    @questions[cat].shift
  end

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
