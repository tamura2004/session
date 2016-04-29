class MenusController < ApplicationController
  before_action :set_menu, only: [:index, :show, :edit, :update, :destroy]

  def index
    render :show
  end

  def show

    case @menu.name

    when "新しいキャラクターを作る"
      @choices = 6.times.map{Pc.new}

    when /ボルタック商店/
      @choices = Pc.all
      @title = "誰が入店しますか"

    when /アイテムを買う/
      @choices = Item.all

    when /アイテムを売る/
      pc = Pc.find(session[:pc_id])
      @delete = true
      @choices = pc.equipments

    else
      if @menu.path
        redirect_to Menu.find_by(name: @menu.path)

      elsif @menu.name !~ /battle/i
        session[:menu_id] = @menu.id
      end
    end
  end

  def update

    case @menu.name

    when "新しいキャラクターを作る"
      Pc.create(params.require(:form).permit!)
      redirect_to Menu.find_by(name: @menu.path)

    when "アイテムを買う"
      Equipment.create(pc_id: session[:pc_id], item_id: params[:form][:id])
      redirect_to Menu.find_by(name: "ボルタック商店")

    when "ボルタック商店"
      id = params[:form][:id]
      session[:pc_id] = id
      pc = Pc.find(id)
      @title = "いらっしゃいませ。#{pc.name}さん。"
      render :show
    end

  end

  def destroy
    case @menu.name

    when "アイテムを売る"
      Equipment.find(params[:form][:id]).delete
      redirect_to Menu.find_by(name: "ボルタック商店")
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      id = params[:id] || session[:menu_id] || Menu.find_by(name: "リルガミン城")
      @menu = Menu.find(id)
    end

end
