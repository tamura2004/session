class Pc::KlassesController < ApplicationController
  before_action :set_pc, only: [:edit, :update]

  def edit
    @klasses = %w(ファイター ウィザード クレリック ローグ)
  end

  def update
    @pc.klass = params[:klass]

    if @pc.save
      redirect_to :training_top
    else
      render :edit
    end
  end

  private
    def pc_id
      params[:pc_id]
    end

    def set_pc
      @pc = Pc.find(params[:pc_id])
    end

    def klass_params
      params.require(:pc_klass).permit(:klass_id)
    end
end
