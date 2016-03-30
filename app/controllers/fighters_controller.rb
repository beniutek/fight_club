class FightersController < ApplicationController
  before_action :set_fighter, only: [:show, :edit, :update, :destroy]

  # GET /fighters
  # GET /fighters.json
  def index
    @fighters = Fighter.all.includes(:skills)
  end

  # GET /fighters/1
  # GET /fighters/1.json
  def show
    @comments = @fighter.comments
    @new_comment = @fighter.comments.new

    respond_to do |format|
      format.html
      format.json { render json: @fighter }
    end
  end

  def most_fights
    @fighters = Fighter.most_fights.includes(:skills)
    render 'index'
  end

  def most_wins
    @fighters = Fighter.most_wins.includes(:skills)
    render 'index'
  end
  # GET /fighters/new
  def new
    @fighter = Fighter.new
    @fighter.fighter_skills.build
    @skills = Skill.all
  end

  # GET /fighters/1/edit
  def edit
  end

  # POST /fighters
  # POST /fighters.json
  def create

    @fighter = Fighter.new(fighter_params)
    @skills = Skill.all

    respond_to do |format|
      if @fighter.save
        format.html { redirect_to @fighter, notice: 'Fighter was successfully created.' }
        format.json { render :show, status: :created, location: @fighter }
      else
        format.html { render :new }
        format.json { render json: @fighter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fighters/1
  # PATCH/PUT /fighters/1.json
  def update
    respond_to do |format|
      if @fighter.update(fighter_params)
        format.html { redirect_to @fighter, notice: 'Fighter was successfully updated.' }
        format.json { render :show, status: :ok, location: @fighter }
      else
        format.html { render :edit }
        format.json { render json: @fighter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fighters/1
  # DELETE /fighters/1.json
  def destroy
    @fighter.destroy
    respond_to do |format|
      format.html { redirect_to fighters_url, notice: 'Fighter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fighter
      @fighter = Fighter.includes(:skills).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fighter_params
      params.require(:fighter).permit(:first_name, :last_name, :nickname, :image, :remote_image_url, fighter_skills_attributes: [:skill_id, :value])
    end
end
