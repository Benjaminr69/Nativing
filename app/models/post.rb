class Post < ApplicationRecord
  belongs_to :user
  has_many :post_attachments
  accepts_nested_attributes_for :post_attachments
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 500 }
  include Filterable

    filterrific(
    default_filter_params: {},
    available_filters: [
      :with_mother_tongue,
      :with_locality,
      :with_start_time_gte
    ]
  )

  scope :with_mother_tongue, -> (search_string) { joins(:users).where("users.mother_tongue LIKE ?", (search_string.to_s.gsub('*', '%') + '%').gsub(/%+/, '%'))
  }

  scope :with_locality, -> (search_string) { joins(:users).where("users.locality LIKE ?", (search_string.to_s.gsub('*', '%') + '%').gsub(/%+/, '%'))
  }

  scope :with_start_time_gte, -> (ref_date) { joins(:availabilities).where('availabilities.start_time >= ?', ref_date) }
end
