class Article < ActiveRecord::Base
    belongs_to :user
    validates :title, presence: true, length: {minimum:3, maximum:50} #won't allow an object to his the DB without a title
    validates :description, presence: true, length: {minimum:10, maximum: 300}
end