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
             :votes_for
  has_one :user
end
