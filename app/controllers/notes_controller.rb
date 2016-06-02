class NotesController < ApplicationController

  before_filter :require_administrative_privileges, :only => [:destroy, :edit, :update]
  before_filter :find_event, :only => [:create, :new]

  def find_event
    @event = Event.find_by(sid: params[:sid], cid: params[:cid])
    @user = User.current_user
  end

  def index
  end

  def new
  end

  def create
    @note = @event.notes.create({ :user => @user, :body => params[:body] })
    if @note.save
      Delayed::Job.enqueue(Snorby::Jobs::NoteNotification.new(@note.id))
    end
  end

  def show
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(params[:id])

    end
  end

  def destroy
    @note = Note.find(params[:id])
    @event = @note.event
    @note.destroy
  end

end
