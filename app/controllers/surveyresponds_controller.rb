class SurveyrespondsController < ApplicationController
  before_action :set_surveyrespond, only: [:show, :edit, :update, :destroy]

  # GET /surveyresponds
  # GET /surveyresponds.json
  def index
    @surveyresponds = Surveyrespond.all
  end

  # GET /surveyresponds/1
  # GET /surveyresponds/1.json
  def show
  end

  # GET /surveyresponds/new
  def new
    @surveyrespond = Surveyrespond.new
  end

  # GET /surveyresponds/1/edit
  def edit
  end

  # POST /surveyresponds
  # POST /surveyresponds.json
  def create
    @surveyrespond = Surveyrespond.new
    @surveyrespond.info1 = "abcd"
    @surveyrespond.info2 = "xyz";

    # Is there a professional team taking decisions?
    if (params[:IsThere].to_s == "IsThereYes")
      @surveyrespond.arepros = 1.0
    elsif (params[:IsThere].to_s == "IsThereNo")
      @surveyrespond.arepros = 0.0
    end

    # Are you a part of that team?
    if (params[:AreYou].to_s == "AreyouYes")
      @surveyrespond.areyou = 1.0
    elsif (params[:AreYou].to_s == "AreyouNo")
      @surveyrespond.areyou = 0.0
    end

    # Transparency?
    if (params[:AwareCLear].to_s == "ClearAwareYes")
      @surveyrespond.transparent = 1.0
    elsif (params[:AwareCLear].to_s == "ClearAwareMaybe")
      @surveyrespond.transparent = 0.5
    elsif (params[:AwareCLear].to_s == "ClearAwareNo")
      @surveyrespond.transparent = 0.0
    end

    # Parallel and Remote
    if (params[:Parallel].to_s == "ParallelYes")
      @surveyrespond.remote = 1.0
    elsif (params[:Parallel].to_s == "ParallelMaybe")
      @surveyrespond.remote = 0.5
    elsif (params[:Parallel].to_s == "ParallelNo")
      @surveyrespond.remote = 0.0
    end

    # Aligned to vision?
    if (params[:Vision].to_s == "VisionYes")
      @surveyrespond.alignment = 1.0
    elsif (params[:Vision].to_s == "VisionMaybe")
      @surveyrespond.alignment = 0.5
    elsif (params[:Vision].to_s == "VisionNo")
      @surveyrespond.alignment = 0.0
    end

    #Faster
    if (params[:Faster].to_s == "FasterYes")
      @surveyrespond.faster = 1.0
    elsif (params[:Faster].to_s == "FasterMaybe")
      @surveyrespond.faster = 0.5
    elsif (params[:Faster].to_s == "FasterNo")
      @surveyrespond.faster = 0.0
    end

    #Cheaper
    if (params[:Cheaper].to_s == "CheaperYes")
      @surveyrespond.cheaper = 1.0
    elsif (params[:Cheaper].to_s == "CheaperMaybe")
      @surveyrespond.cheaper = 0.5
    elsif (params[:Cheaper].to_s == "CheaperNo")
      @surveyrespond.cheaper = 0.0
    end

    #Discrepencies
    if (params[:Discrepencies].to_s == "DiscrepenciesYes")
      @surveyrespond.discre = 1.0
    elsif (params[:Discrepencies].to_s == "DiscrepenciesYes")
      @surveyrespond.discre = 0.5
    elsif (params[:Discrepencies].to_s == "DiscrepenciesYes")
      @surveyrespond.discre = 0.0
    end


    @LandingPages10 = Array.new
    @LandingPages05 = Array.new

    @LandingPages10.push('https://www.google.com')

    if(@LandingPages10.count > 0)
        @LandingPage = @LandingPages10[0] # random
      end

    respond_to do |format|
      if @surveyrespond.save

        format.html { redirect_to @surveyrespond }
        format.json { render :show, status: :created, location: @surveyrespond }
      else
        format.html { render :new }
        format.json { render json: @surveyrespond.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /surveyresponds/1
  # PATCH/PUT /surveyresponds/1.json
  def update
    respond_to do |format|
      if @surveyrespond.update(surveyrespond_params)
        format.html { redirect_to @surveyrespond, notice: 'Surveyrespond was successfully updated.' }
        format.json { render :show, status: :ok, location: @surveyrespond }
      else
        format.html { render :edit }
        format.json { render json: @surveyrespond.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveyresponds/1
  # DELETE /surveyresponds/1.json
  def destroy
    @surveyrespond.destroy
    respond_to do |format|
      format.html { redirect_to surveyresponds_url, notice: 'Surveyrespond was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_surveyrespond
      @surveyrespond = Surveyrespond.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def surveyrespond_params
      params.require(:surveyrespond).permit(:info1, :info2, :arepros, :areyou, :transparent, :remote, :alignment, :faster, :cheaper, :discre)
    end

      def GetLandingPageURL
         #'http://www.google.com'
      end
end
