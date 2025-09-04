class PrvesController < ApplicationController
  before_action :set_profile, only: %i[ show edit update destroy ]

  # GET /prves or /prves.json
  def index
    @prves = profile.all
  end

  # GET /prves/1 or /prves/1.json
  def show
  end

  # GET /prves/new
  def new
    @profile = profile.new
  end

  # GET /prves/1/edit
  def edit
  end

  # POST /prves or /prves.json
  def create
    @profile = profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: "profile was successfully created." }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prves/1 or /prves/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: "profile was successfully updated." }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prves/1 or /prves/1.json
  def destroy
    @profile.destroy!

    respond_to do |format|
      format.html { redirect_to prves_path, status: :see_other, notice: "profile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = profile.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.expect(profile: [ :user_id, :name ])
    end
end
