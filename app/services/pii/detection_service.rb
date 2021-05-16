# frozen_string_literal: true

module Pii
  class DetectionService
    def initialize(note)
      @note = note
      @comprehend_client = Aws::Comprehend::Client.new(region: 'eu-central-1')
      @detection_result = []
      @detected_entities = []
      @redacted_note = nil
    end

    def call
      result = detect_pii_entities(note.content)
      if pii_detected?(result)
        @detection_result = result.entities
        @detected_entities = build_detection_details(detection_result, note.content)
        @redacted_note = redact_note(@detection_result, note.content)
      end
      self
    end

    attr_reader :comprehend_client, :note, :detection_result, :detected_entities, :redacted_note

    private

    def build_detection_details(detection_result, note_content)
      return if detection_result.blank?

      details = []
      detection_result.map do |entity|
        detail = "#{entity_name(entity, note_content)} is a #{entity[:type]} PII data"
        details << detail
      end
      details
    end

    def redact_note(entities, note_to_redact)
      redacted_note = note_to_redact.dup
      entities.each do |entity|
        redacted_note[entity[:begin_offset], entity_offset_difference(entity)] = '*' * entity_offset_difference(entity)
      end
      redacted_note
    end

    def detect_pii_entities(note_content)
      comprehend_client.detect_pii_entities(text: note_content, language_code: 'en')
    end

    def entity_name(entity, note_content)
      note_content[entity[:begin_offset], entity_offset_difference(entity)]
    end

    def entity_offset_difference(entity)
      entity[:end_offset] - entity[:begin_offset]
    end

    def pii_detected?(result)
      result.entities.any?
    end
  end
end
