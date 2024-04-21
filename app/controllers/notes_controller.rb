
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

    respond_to do |format|
      if @note_new.save     
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end


  def edit
    @note = Note.find(params[:id])
  end


  def update
    @note = Note.find(params[:id])

    respond_to do |format|
      if @note.update(notes_params)
        format.turbo_stream
      end
    end
  end

  def destroy
    @note = Note.find(params[:id])
    
    respond_to do |format|
      if @note.destroy
        format.turbo_stream
      end
    end
     
  end

  def show
    @note = Note.find(params[:id])
  end
  

  def new
    @note = Note.new
  end

  private
  
  def notes_params
    params.require(:note).permit(:user_id, :title, :description, :status_progress)
  end



end
