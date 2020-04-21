class ProblemSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :content,
             :hint,
             :solution,
             :rating,
             :answer,
             :category,
             :user,
             :votes_for,
             :cached_votes_total,
             :cached_votes_score,
             :cached_votes_up,
             :cached_weighted_average
  has_one :user
end
