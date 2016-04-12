class KlassesController < ApplicationController
  before_action :set_pc, only: [:new, :create]

  def new
    @klass = PcKlass.new
    @candidates = 6.times.map do
      Klass.sample(3).instance_eval do
        [
          pluck(:name).join(" / "),
          ids.join("|")
        ]
      end
    end
  end

  def create
    klass_params[:klass_id].split("|").each do |id|
      PcKlass.create(pc_id: pc_id, klass_id: id)
    end
    redirect_to new_pc_skill_path(@pc)
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
