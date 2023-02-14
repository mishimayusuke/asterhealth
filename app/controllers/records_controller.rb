class RecordsController < ApplicationController
  before_action :set_record, only: %i[ show edit update destroy ]

  # GET /records or /records.json
  def index
    today = Date.today.strftime("%Y/%m/%d")
    @levels = Level.all
    @records = Record.all.order("recorded")
    @record_data = Record.new
    @user_data = User.find(session[:user_id])
    @login_user_records = @records.where( user_id:session[:user_id])
    @level_name = Level.find(@user_data.level_id).level_name
    @goal_step = Level.find(@user_data.level_id).goal_step
    #今日の歩数
    @today_step = Record.find_by( user_id: session[:user_id], recorded: today)
    if @today_step.present?
      if @today_step.step > @goal_step
        @today_step2 = @goal_step
      else
        @today_step2 = @today_step.step
      end
    else
      @today_step2 = 0
    end
    today_4 = (Date.today-4).strftime("%Y/%m/%d")
    days_ary = []
    #５日分のデータの取得
    achievement_5days = Record.where( user_id: session[:user_id], recorded: (today_4)..today)
    achievement_5days.each do | day_record |
      if day_record.step >= @goal_step
        days_ary << day_record.step
      end
    end
    @achievement_count = days_ary.count

    #logger.debug("===========")
    #logger.debug(@achievement_count)
    #logger.debug(days_ary)
    #順位
    bigginer_level = @levels.find_by(level_name: "初級")
    bigginer_users = User.where( level_id: bigginer_level )
    today_records = []
    bigginer_users.each do |user|
      user_record = @records.find_by(user_id: user, recorded: today)
      today_records.push(user_record.step) if user_record
    end
    today_records.sort!
    @entry = today_records.count
    @rank = today_records.index( @today_step)
    @rank = @entry unless @rank
    logger.debug("===========")
    logger.debug(@entry)
    logger.debug(@rank)
    logger.debug(@today_step)
    logger.debug(today_records)
    logger.debug("===========")

   
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
    today = Date.today.strftime("%Y/%m/%d")
    @record = Record.where( user_id: session[:user_id], recorded: today)
    if @record.count == 0
      # 新しい日付で歩数を登録した場合
      @record = Record.new(record_params)
      @record.user_id = session[:user_id]
      @record.recorded = Date.today.strftime("%Y/%m/%d")
      if @record.save
        redirect_to records_path
      else
        render
      end
    else
      # 同じ日付で新しい歩数を登録した場合
      @record = Record.find_by( user_id: session[:user_id], recorded: today)
      @record.recorded = Date.today.strftime("%Y/%m/%d")
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
