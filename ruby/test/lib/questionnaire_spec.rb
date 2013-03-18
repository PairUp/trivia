require 'minitest/spec'
require_relative '../../lib/questionnaire'

describe Questionnaire do
  it "gives the question category" do
    Questionnaire.category_for(4).must_equal "Pop"
    Questionnaire.category_for(5).must_equal "Science"
    Questionnaire.category_for(2).must_equal "Sports"
    Questionnaire.category_for(22).must_equal "Rock"
  end
end

exit MiniTest::Unit.new.run
