class Study < ActiveRecord::Base
  include AASM

  aasm column: :state do
    state :draft, initial: true
    state :waiting_for_review
    state :accepted
    state :rejected
    state :deleted

    event :submit_for_review do
      transitions from: [:draft], to: [:waiting_for_review]
      before do
        self.submited_for_review_at = Time.now
      end
    end

    event :accept do
      transitions from: [:waiting_for_review], to: :accepted
      before do
        self.accepted_at = Time.now
      end
    end

    event :reject do
      transitions from: [:waiting_for_review], to: :rejected
      before do
        self.rejected_at = Time.now
      end
    end

    event :deleted do
      transitions to: :deleted
      before do
        self.deleted_at = Time.now
      end
    end
  end

  mount_uploader :carousel_image, CarouselImageUploader

  belongs_to :category, counter_cache: true
  belongs_to :author, class_name: 'User', inverse_of: :studies

  validates :title, presence: true
  validates :body, presence: true
  validates :category, presence: true
  validates_presence_of :carousel_image, if: :in_carousel?

  scope :active, -> { where('deleted_at IS NULL') }
  scope :deleted, -> { where('deleted_at IS NOT NULL') }

  delegate :tile_image, to: :category

  def deleted?
    deleted_at.present?
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end

  def push_to_carousel!
  end

  def duplicate!
    attrs = self.attributes.slice(*%w(category_id author_id title body summary))
    self.class.create!(attrs)
  end
end
