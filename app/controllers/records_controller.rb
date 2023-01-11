class RecordsController < ApplicationController
  before_action :set_record, only: %i[ show edit update destroy ]

  # GET /records or /records.json
  def index
    @levels = Level.all
    @records = Record.all
    @record_data = Record.new
    @user_data = User.find(session[:user_id])
    @level_name = Level.find(@user_data.level_id).level_name
  end

  # GET /records/1 or /records/1.json
  def show
  end

  # GET /records/new
  def new
    @record = Record.new
  end

  # GET /records/1/edit
  def edit
  end

  # POST /records or /records.json
  def create
    @record = Record.where( user_id: session[:user_id], created_at: (Date.today)..(Date.today+1))
    if @record.count == 0
      # 新しい日付で歩数を登録した場合
      @record = Record.new(record_params)
      @record.user_id = session[:user_id]
      @record.recorded = Date.today
      if @record.save
        redirect_to records_path
      else
        render
      end
    else
      # 同じ日付で新しい歩数を登録した場合
      @record = Record.find_by( user_id: session[:user_id], created_at: (Date.today)..(Date.today+1) )
      @record.recorded = Date.today
      if @record.update(record_params)
        redirect_to records_path
      else
        render
      end
    end
    # end
    
  end

  # PATCH/PUT /records/1 or /records/1.json
  def update
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to record_url(@record), notice: "Record was successfully updated." }
        format.json { render :show, status: :ok, location: @record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  def level_update
    if @level.update(level_params)
      format.html { redirect_to record_url(@record), notice: "Record was successfully updated." }
      format.json { render :show, status: :ok, location: @record }
    else
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @record.errors, status: :unprocessable_entity }
    end
  end

  # DELETE /records/1 or /records/1.json
  def destroy
    @record.destroy

    respond_to do |format|
      format.html { redirect_to records_url, notice: "Record was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = Record.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def record_params
      params.require(:record).permit(:user_id, :recorded, :step, :rank)
    end

    def level_params
      params.require(:level).permit(:goal_step, :level_stop, :level_name)
    end


end
