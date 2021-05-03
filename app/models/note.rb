# frozen_string_literal: true

class Note < ApplicationRecord
  validates :content, presence: true, length: { minimum: 2, maximum: 500 }
end
