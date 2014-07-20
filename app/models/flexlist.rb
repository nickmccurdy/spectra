class Flexlist < ActiveRecord::Base
  include Playable
  extend FriendlyId

  has_many :rules

  friendly_id :name,  use: [:slugged, :finders]

  enum match: [:any_rules, :all_rules]

  validates :match, presence: true
end
