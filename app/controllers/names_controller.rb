class NamesController < ApplicationController
  before_action :set_pc, only: [:edit, :update]

  # GET /pcs/:pc_id/name/edit
  def edit
    @names = 6.times.map do
      words.instance_eval do
        [
          sprintf("\"%s%s\" %s %s",*map(&:name)),
          map(&:id).join("|")
        ]
      end
    end
  end

  # PATCH/PUT /pcs/:pc_id/name
  def update
    a,b,c,d = pc_params[:words].split("|")
    @pc.handle_before_id = a
    @pc.handle_after_id = b
    @pc.family_name_id = c
    @pc.given_name_id = d

    if @pc.save
      redirect_to edit_pc_race_path(@pc)
    else
      render :edit
    end
  end

  private
    def words
      %w(HandleBefore HandleAfter FamilyName GivenName).map do |type|
        w = Word.where(type: type).choose
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_pc
      @pc = Pc.find(params[:pc_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pc_params
      params.require(:pc).permit(:words)
    end
end
