class NotesController < ApplicationController
  before_action :authenticate_user! 


  def index
    @note_new = Note.new
    @user = current_user
    @notes = @user.notes 
    
  end

  def create
    @note_new = Note.new(notes_params)
    @note_new.user = current_user
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
    params.require(:note).permit(:user_id, :title, :description)
  end



end
