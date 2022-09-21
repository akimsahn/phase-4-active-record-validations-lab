class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction']}
    validate :title_must_be_clickbaity

    def title_must_be_clickbaity
        unless title && ["Won't Believe", "Secret", "Top", "Guess"].any? { |keyword| title.include? keyword }
            errors.add(:title, 'Title is not clickbait-y')
        end
    end
end
