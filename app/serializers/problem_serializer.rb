class ProblemSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :hint, :solution, :rating, :answer, :category, :user
  has_one :user
end
