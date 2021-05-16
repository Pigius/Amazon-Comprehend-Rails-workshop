# frozen_string_literal: true

class Note < ApplicationRecord
  validates :content, presence: true, length: { minimum: 2, maximum: 1000 }
  validates :redacted_content, length: { minimum: 2, maximum: 1000 }
end
