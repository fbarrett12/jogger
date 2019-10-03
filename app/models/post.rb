class Post < ApplicationRecord
    has_many :comments
    belongs_to :user
    
    validates :title, presence: true
    validates :body, presence: true

    # def self.find_user(x)
    #     user = User.find_by(id: x )
    #     user.name
    # end

    # def self.explore(&block)
    #     if block_given?
    #     self.all.each do |post|
    #         post.title
    #         post.body[0...10]
    #         block.call(post.user.id)
    #         end
    #     else
    #         puts "oops"
    #     end
    # end

end
