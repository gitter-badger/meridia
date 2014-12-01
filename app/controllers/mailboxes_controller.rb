class MailboxesController < ApplicationController
  before_action :set_mailbox, only: [:show, :edit, :update, :destroy]

  # GET /mailboxes
  # GET /mailboxes.json
  def index
    @mailboxes = current_user.mailboxes
  end

  # GET /mailboxes/1
  # GET /mailboxes/1.json
  def show
    @mgs = Messenger.all
  end

  # GET /mailboxes/new
  def new
    @mailboxes = current_user.mailboxes
    @mailbox = Mailbox.new
  end

  # GET /mailboxes/1/edit
  def edit
  end

  # POST /mailboxes
  # POST /mailboxes.json
  def create
    @mailbox = Mailbox.new(mailbox_params)

    respond_to do |format|
      if @mailbox.save
        format.html { redirect_to @mailbox, notice: 'Mailbox was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mailbox }
      else
        format.html { render action: 'new' }
        format.json { render json: @mailbox.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mailboxes/1
  # PATCH/PUT /mailboxes/1.json
  def update
    respond_to do |format|
      if @mailbox.update(mailbox_params)
        format.html { redirect_to @mailbox, notice: 'Mailbox was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mailbox.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mailboxes/1
  # DELETE /mailboxes/1.json
  def destroy
    @mailbox.destroy
    respond_to do |format|
      format.html { redirect_to mailboxes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mailbox
      @mailbox = current_user.mailbox
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mailbox_params
      params.require(:mailbox).permit(:name)
    end
end
