class NursingController < ApplicationController
  #before_action :set_vig, only: [:show, :edit, :update, :destroy]
  #before_action :set_member,only: [:index, :show, :create, :update]

  # GET /nursing
  # GET /nursing.json
  def index
    #@medicals = Medical.all
    @member = Member.find(params[:member_id])
    @vie =  Vig.find_by( member: @member, kind: :nursing )

  end

  # GET /nursing/1
  # GET /nursing/1.json
  def show
    #@member= Member.find(params[:member_id])
  end

  # GET /nursing/new
  def new
    @member = Member.find(params[:member_id])

    # check for initial evaluation
    @member.vigs.create! kind: :nursing

    @member.allergies.build kindof: :medicine
    @member.medicines.build day: [:monday, :tuesday, :wednesday, :thursday, :friday ]
  end

  # GET /nursing/step_two
  def step_two
    @member = Member.find(params[:member_id])
  end

  def step_three
    @member = Member.find(params[:member_id])
  end

  def step_four
    @member = Member.find(params[:member_id])
  end

  def step_five
    @member = Member.find(params[:member_id])
  end

  # GET /nursing/1/edit
  def edit
  end

  # POST /nursing
  # POST /nursin.json
  def create
    #@vig = Vig.new(vig_params)
    @member = Member.find(params[:member_id])
    respond_to do |format|
      case params[:_step]
      when 'step_one'

        if @member.update!(member_params.except(:medicines_attributes))

          medicines_attributes = member_params[:medicines_attributes]
          medicines_attributes.each do |i, medicine|
            m = Medicine.new( name: medicine[:name], frequency: medicine[:frequency], dose: medicine['dose'], way: medicine[:way], validity: medicine[:validity] )
            medicine['day' ].each do |day|
              m.day << day.to_sym
            end
            @member.medicines << m
          end

          format.html { redirect_to step_two_member_nursing_index_path(@member), notice: '' }
        else
          format.html { render action: 'new' }
        end

      when 'step_two'
        if @member.update!(member_params)
          format.html { redirect_to step_three_member_nursing_index_path(@member), notice: '' }
        else
          format.html { render action: 'new' }
        end

      when 'step_three'
        if @member.update!(member_params)
          format.html { redirect_to step_four_member_nursing_index_path(@member), notice: '' }
        else
          format.html { render action: 'new' }
        end

      when 'step_four'
        if @member.update!(member_params)
          format.html { redirect_to step_five_member_nursing_index_path(@member), notice: '' }
        else
          format.html { render action: 'new' }
        end
      when 'step_five'
        if @member.update!(member_params)
          format.html { redirect_to step_five_member_nursing_index_path(@member), notice: '' }
        else
          format.html { render action: 'new' }
        end
      else
      end
    end
  end



  # PATCH/PUT /vigs/1
  # PATCH/PUT /vigs/1.json
  def update
    respond_to do |format|
      if @vig.update(vig_params)
        format.html { redirect_to @vig, notice: 'Vig was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /medicals/1
  # DELETE /medicals/1.json
  def destroy
    @medical.destroy
    respond_to do |format|
      format.html { redirect_to vigs_url }
      format.json { head :no_content }
    end
  end

  private
  def set_member
    @member = Member.find(params[:member_id])
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_vig
    @vig = Vig.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def member_params
    #params.require(:vig).permit(:name, :date, :test_ids=>[])
    params.require(:member).permit({
      allergies_attributes: [ :id, :kindof, :name ], 
      medicines_attributes: [ :id, :name, :frequency, :dose, :way, :validity, day: [  ] ], 
      bloods_attributes: [ :level ], 
      others_attributes: [ :edema, :edema_level, :capilar ], 
      breaths_attributes:[ :level ], 
      nutritions_attributes: [ :lose, :masticate, :eat, :none, :change, :change_note, :foods ], 
      bodies_attributes: [:skin,:mucous,:dentition,:oral_cavity,:previous_fallen,:medicines,:sensory_deficits,:state_of_mind,:ambulation],
      depositions_attributes: [ :urinary_pattern, :urinary_frequency, :urinary_alterations, :intestinal_movement, :intestinal_pattern, :intestinal_frequency, :intestinal_characteristics, :laxatives, :laxatives_notes, :catheter_or_ostomy, :catheter_or_ostomy_note, :sweating ],
      mobilizations_attributes: [:mobilization, :dominant_member, :devices],
      hygienes_attributes: [:bath, :hair, :teeth, :observations ],
      communications_attributes: [:see,:hear,:speak, :hearing_aid, :contact_lenses, :glasses, :observations],
      sleeps_attributes: [:duration,:nap,:pattern,:drugs,:drugs_note,:other,:other_note,:observations],
      pains_attributes: [:has_pain,:has_pain_note,:location,:over_pain,:value,:level]
    })
  end
end
