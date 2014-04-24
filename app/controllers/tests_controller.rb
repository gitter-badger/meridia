class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]

  # GET /tests
  # GET /tests.json
  def index
    @tests = Test.all
  end

  # GET /tests/1
  # GET /tests/1.json
  def show
    #@member = Member.find(params[:member_id])
    #@vig= Vig.find(params[:vig_id])
    #@questions= @test.questions
    @test[ 'jota' ] = "JAVIEr"
    @answers = []
    @test.questions.each do |q|
      case q.type
      when 'section'
        q.questions.each do |question| 
          @answers << Answer.new({question: question})
          @test.write_attribute(:gender, "Male")
        end
      else
        @answers << Answer.new({question: q})
      end
    end
    @answers = Array.new(@test.questions.count){Answer.new}
    #@test.answers = @answers


  end

  # GET /tests/new
  def new
    @test = Test.new
    3.times {@test.questions.build}
  end

  # GET /tests/1/edit
  def edit
  end

  # POST /tests
  # POST /tests.json
  def create
    @test = Test.new(test_params)

    respond_to do |format|
      if @test.save
        format.html { redirect_to @test, notice: 'Test was successfully created.' }
        format.json { render action: 'show', status: :created, location: @test }
      else
        format.html { render action: 'new' }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1
  # PATCH/PUT /tests/1.json
  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to @test, notice: 'Test was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_test
    @test = Test.includes(:questions).find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def test_params
    params.require(:test).permit(:title, :observation, :description, :questions_attributes => [:content,:level, :type, :points])
  end
end
