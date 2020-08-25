require 'rails_helper'

RSpec.describe Problem, type: :model do
  describe 'creation' do
    it 'can be created' do
      problem = Problem.create(name: 'testname',
                               content: 'testcontent',
                               hint: 'testhint',
                               solution: 'testsolution',
                               rating: 0,
                               answer: 'testanswer',
                               category: 'testcategory')
      expect(problem).to be_valid
    end
  end
end
