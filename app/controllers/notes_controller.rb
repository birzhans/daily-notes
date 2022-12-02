class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = current_user.notes
  end

  def show
  end

  def new
    @note = Note.new
  end

  def edit
  end

  def create
    @note = current_user.notes.new(note_params)

    if @note.save
      render turbo_stream: [
        turbo_stream.prepend('notes', @note),
        turbo_stream.replace('new-note-form', partial: 'new_note_button')
      ]
    else
      render 'new'
    end
  end

  def update
    if @note.update(note_params)
      redirect_to @note
    else
      render 'edit'
    end
  end

  def destroy
    @note.destroy
    render turbo_stream: turbo_stream.remove(@note)
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:body, :date)
  end
end