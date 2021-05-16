# frozen_string_literal: true

class NotesController < ApplicationController
  def index
    @notes = Note.order('created_at DESC')
  end

  def create
    note = Note.new(note_params)
    pii_detection = Pii::DetectionService.new(note).call
    update_with_pii_data(pii_detection, note)

    flash[:notice] = "Note create failed. #{note.errors.full_messages.first}" unless note.save

    redirect_to notes_path
  end

  private

  def update_with_pii_data(detection_result, note)
    return unless detection_result.detection_result.any?

    note.update!({ detected_pii_entities: detection_result.detected_entities,
                   redacted_content: detection_result.redacted_note })
  end

  def note_params
    params.require(:note).permit(:content)
  end
end
