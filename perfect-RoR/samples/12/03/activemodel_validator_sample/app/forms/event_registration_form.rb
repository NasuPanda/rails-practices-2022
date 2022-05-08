class EventRegistrationForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :start_at, :datetime
  attribute :end_at, :datetime

  validates_with PeriodValidator, from: :start_at, to: :end_at
end
