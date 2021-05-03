# frozen_string_literal: true

class NotesController < ApplicationController
  def index
    @notes = Note.order('created_at DESC')
  end

  def create
    note = Note.new(note_params)
    flash[:notice] = "Note create failed. #{note.errors.full_messages.first}" unless note.save

    redirect_to notes_path
  end

  private

  def note_params
    params.require(:note).permit(:content)
  end
end
