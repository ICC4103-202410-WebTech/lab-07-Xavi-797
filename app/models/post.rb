class Post < ApplicationRecord
    belongs_to :user
    has_many :post_tags
    has_many :tags, through: :post_tags

    # Association for the parent post (optional)
    belongs_to :parent_post, class_name: 'Post', optional: true

    # Association for child posts
    has_many :child_posts, class_name: 'Post', foreign_key: 'parent_post_id'

    validates :title, presence: { message: "Title cannot be blank." }
    validates :content, presence: { message: "Content cannot be blank." }
    validates :user_id, presence: { message: "Post must be associated with a user." }
    validates :answers_count, numericality: { greater_than_or_equal_to: 0, message: "Answers count cannot be negative." }
    validates :likes_count, numericality: { greater_than_or_equal_to: 0, message: "Likes count cannot be negative." }

    before_validation :set_default_published_at, on: :create

    private
    def set_default_published_at
        self.published_at ||= Time.current
    end
end