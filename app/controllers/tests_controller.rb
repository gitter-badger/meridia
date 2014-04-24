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
		@vig= Vig.find(params[:vig_id])
		@member = @vig.member
		@questions= @test.questions
		@answers = Array.new(@questions.count){Answer.new}
	
	end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_params
      params.require(:test).permit(:title, :observation, :description, :questions_attributes => [:content,:level, :type, :points])
    end
end
