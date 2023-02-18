# frozen_string_literal: true

class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new(note_params)
  end

  def create
    @note = Note.new(note_params).save
  end

  private

  def note_params
    params.require(:note).permit(:title, :html_file, :tag)
  end
end
