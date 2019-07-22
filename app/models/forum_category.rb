class ForumCategory < ApplicationRecord
  has_many :forum_topics, -> { order(id: :desc) }
  validates_uniqueness_of :name, case_sensitive: false

  after_destroy :reassign_topics

  def reassign_topics
    ForumTopic.where(category: id).update_all(category_id: 0)
  end

  def can_create_within?(user = CurrentUser.user)
    user.level >= can_create
  end

  def self.reverse_mapping
    order(:cat_order).all.map { |rec| [rec.name, rec.id] }
  end

  def self.ordered_categories
    order(:cat_order)
  end
end