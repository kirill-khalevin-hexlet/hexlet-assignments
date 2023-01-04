# frozen_string_literal: true

class Vacancy < ApplicationRecord
  include AASM

  validates :title, presence: true
  validates :description, presence: true

  # BEGIN
  aasm do
    state :on_moderate, initial: true
    state :published, :archived
  end
  # END
end
