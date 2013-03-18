require 'minitest/spec'
require_relative '../../lib/questionnaire'

describe Questionnaire do
  it "initializes the questions" do
    q = Questionnaire.new
    %w(Pop Science Sports Rock).each do |cat|
      assert_equal q.next_question(cat), "#{cat} Question 0"
      assert_equal q.next_question(cat), "#{cat} Question 1"
    end
  end

  it "gives the question category" do
    Questionnaire.category_for(4).must_equal "Pop"
    Questionnaire.category_for(5).must_equal "Science"
    Questionnaire.category_for(2).must_equal "Sports"
    Questionnaire.category_for(22).must_equal "Rock"
  end
end

exit MiniTest::Unit.new.run
