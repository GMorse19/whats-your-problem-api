class Problem < ApplicationRecord
  belongs_to :user
  acts_as_votable

  def flag_true
    Problem.votes_for.where(:votable_id === Problem.id)
           .pluck(:vote_flag)
  end
end
