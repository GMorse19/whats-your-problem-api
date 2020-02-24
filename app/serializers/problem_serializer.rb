class ProblemSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :hint, :solution, :rating, :answer, :category
  has_one :user
end
