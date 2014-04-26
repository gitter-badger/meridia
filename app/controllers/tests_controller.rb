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

    @formulario = Form.new( name: "Javier" )
    @test.questions.each do |q|
      case q.type
      when 'section'
        @input = @formulario.members.build type: 'section', name: q.content
        q.questions.each do |question|
          if question.type == 'check'
            @answer = @input.answers.build( type: 'checkbox', content: question.content, id_question: question.id )
            question.options_answers.each do |opt|
              @answer.answers << Answer.new(vig_id: @vig.id , type: 'radio', question: question, option: opt )
            end
          else
            @input.answers << Answer.new( note: nil, question: question, type: 'text_field' )
          end
        end
      when 'text', 'textarea'
        @input = @formulario.members.build type: 'text_field', name: q.content
        @input.answers << Answer.new( note: nil, question: q )
      when 'check'

        @input = @formulario.members.build type: 'checkbox', name: q.content, id_question:q.id
				puts q.id
        q.options_answers.each do |question|

          @input.answers << Answer.new(vig_id: @vig.id , type: 'checkbox', question: q, option: question )
        end

      else
        #puts @input.name
      end
    end

    #@questions= @test.questions
    #@answers = Array.new(@questions.count){Answer.new}
    #
  end

    # GET /tests/new
  def new
    @test = Test.new
    3.times {@test.questions.build}
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
