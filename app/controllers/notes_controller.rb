class NotesController < ApplicationController
  def index
    @note_new = Note.new
    @notes = Note.all
  end

  def create
    @note_new = Note.new(notes_params)
    @note_new.save
    redirect_to root_path
  end

  def update
    @note = Note.find(params[:id])
    @note.update(notes_params)
    redirect_to root_path
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to root_path
  end


  private
  
  def notes_params
    params.require(:note).permit(:title, :description)
  end

end
