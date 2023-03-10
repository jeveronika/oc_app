class EntriesController < ApplicationController
  before_action :set_entry, only: %i[ show edit update destroy ]
  before_action :authenticate_user!#, except: %i[ show index ]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  

  # GET /entries or /entries.json
  def index
    @entries = Entry.where(user_id: current_user.id).order(created_at: :desc)
  end

  # GET /entries/1 or /entries/1.json
  def show
    @entry.update(views: @entry.views + 1)
    
  end

  # GET /entries/new
  def new
    @entry = Entry.new
  end

  # GET /entries/1/edit
  def edit
  end

  # POST /entries or /entries.json
  def create
    @entry = Entry.new(entry_params)
    @entry.user = current_user

    respond_to do |format|
      if @entry.save
        format.html { redirect_to entry_url(@entry), notice: "Zápis byl úspěšně vytvořen." }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1 or /entries/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to entry_url(@entry), notice: "Zápis byl úspěšně aktualizován." }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1 or /entries/1.json
  def destroy
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to entries_url, notice: "Zápis byl úspěšně smazán." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def entry_params
      params.require(:entry).permit(:name, :title, :session, :body, :length)
    end

    def record_not_found
      redirect_to entries_path, notice: "Záznam nenalezen"
    end
    

   

end
