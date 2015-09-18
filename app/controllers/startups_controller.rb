class StartupsController < ApplicationController
  before_action :set_startup, only: [:show, :edit, :update, :destroy]

  # GET /startups
  # GET /startups.json
  def index
    @startups = Startup.all
  end

  # GET /startups/1
  # GET /startups/1.json
  def show
    @sid = @startup.id
    @startup_cookie = startup_cookie(@sid)

  end

  # GET /startups/new
  def new
    @startup = Startup.new
  end

  # GET /startups/1/edit
  def edit
  end

  def redirect
       sid = get_cookie()
       @startup = Startup.find(sid)
       logger.debug('NUMBA OF VOTES #{@startup.no_votes}')

       @voter = Voter.find_by_voter_id(params[:temp_id])
       #@startup.voters << @voter

       @startup.no_votes += 1
       @startup.save
       
       logger.debug('NUMBA OF VOTES #{@startup.no_votes}')
       render :show

       
  end

  # POST /startups
  # POST /startups.json
  def create
    @startup = Startup.new(startup_params)
    @startup.no_votes = 0

    respond_to do |format|
      if @startup.save
        format.html { redirect_to @startup, notice: 'Startup was successfully created.' }
        format.json { render :show, status: :created, location: @startup }
      else
        format.html { render :new }
        format.json { render json: @startup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /startups/1
  # PATCH/PUT /startups/1.json
  def update
    respond_to do |format|
      if @startup.update(startup_params)
        format.html { redirect_to @startup, notice: 'Startup was successfully updated.' }
        format.json { render :show, status: :ok, location: @startup }
      else
        format.html { render :edit }
        format.json { render json: @startup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /startups/1
  # DELETE /startups/1.json
  def destroy
    @startup.destroy
    respond_to do |format|
      format.html { redirect_to startups_url, notice: 'Startup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_startup
      @startup = Startup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def startup_params
      params.require(:startup).permit(:name, :startup_id, :description, :photo, :no_votes, :temp_id)
    end
end
