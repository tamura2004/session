class Pc::AbilitiesController < ApplicationController
  before_action :set_pc, only: [:edit, :update ]

  def edit
    @abilities = Array.new(6) do
      Ability.new
    end
  end

  def update
    %w(str dex con int wis cha).each do |abi|
      eval("@pc.#{abi} = params[:#{abi}]")
    end

    if @pc.save
      redirect_to :training_top
    else
      render :edit
    end
  end

  private

    def set_pc
      @pc = Pc.find(params[:pc_id])
    end

end
