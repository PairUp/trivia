require 'minitest/spec'
require_relative '../../lib/questionnaire'

describe Questionnaire do
  it "gives the question category" do
    Questionnaire.current_category(4).must_equal "Pop"
    Questionnaire.current_category(5).must_equal "Science"
    Questionnaire.current_category(2).must_equal "Sports"
    Questionnaire.current_category(22).must_equal "Rock"
  end
end

exit MiniTest::Unit.new.run
