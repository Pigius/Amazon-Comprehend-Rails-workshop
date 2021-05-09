# frozen_string_literal: true

module Pii
  class DetectionService

    def initialize(note)
      @note = note
      @comprehend_client = Aws::Comprehend::Client.new(region: 'eu-central-1')
      @detection_result = []
    end

    def call
      result = detect_pii_entities(note.content)
      detection_result << result if pii_detected?(result)

      detection_result
    end

    attr_reader :comprehend_client, :note, :detection_result

    private

    def pii_detected?(result)
      result.entities.any?
    end

    def detect_pii_entities(note_content)
      comprehend_client.detect_pii_entities(text: note_content, language_code: 'en')
    end
  end
end
