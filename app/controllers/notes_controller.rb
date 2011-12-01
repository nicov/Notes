#encoding: utf-8
class NotesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  # GET /notes
  # GET /notes.xml
  def index
    if params[:q]
      @notes = Note.where("titre LIKE ?", "%#{params[:q]}%").order("created_at DESC").limit(10)
    else
      @notes = Note.order("created_at DESC").limit(10)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @notes }
    end
  end

  # GET /notes/1
  # GET /notes/1.xml
  def show
    @note = Note.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @note }
    end
  end

  # GET /notes/new
  # GET /notes/new.xml
  def new
    @note = Note.new(params[:note])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @note }
    end
  end

  # GET /notes/1/edit
  def edit
    @note = Note.find(params[:id])
  end

  # POST /notes
  # POST /notes.xml
  def create
    @note = Note.new(params[:note])

    respond_to do |format|
      if @note.save
        format.html { redirect_to(edit_note_path(@note), :notice => 'La note a été correctement enregistrée') }
        format.xml  { render :xml => @note, :status => :created, :location => @note }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /notes/1
  # PUT /notes/1.xml
  def update
    @note = Note.find(params[:id])

    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to(edit_note_path(@note), :notice => 'La note a été correctement mise à jour') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.xml
  def destroy
    @note = Note.find(params[:id])
    categorie = @note.categorie
    @note.destroy

    respond_to do |format|
      format.html { redirect_to(categorie.nil? ? notes_url : categorie) }
      format.xml  { head :ok }
    end
  end
  
  def monter
    note = Note.find(params[:id])
    note.monter
    redirect_to note.categorie
  end
  
  def descendre
    note = Note.find(params[:id])
    note.descendre
    redirect_to note.categorie
  end
end
