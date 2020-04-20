class Problem < ApplicationRecord
  belongs_to :user
  acts_as_votable

  def voted?
    # Problem.first.has_voted?(User.first)
    # Problem.first.vote_by voter: User.first, vote_scope: 'true'
    # Problem.first.votes_for.up.by_type(User).voters { |v| v.voter_id == u.id }
    User.voted_for @problem, vote_scope: 'true'
  end
end
