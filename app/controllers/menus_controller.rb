class MenusController < RequirePlayerController
  before_action :set_menu, only: [:index, :show, :edit, :update, :destroy]

  def top
    session.delete(:player_id)
  end

  def show

    # 未読ログ画面へ
    if Log.unread(player.log).present?
      redirect_to :logs
      return
    end

    # 戦闘継続
    if player.battle
      redirect_to player.battle and return
    end

    # 戦闘開始
    if player.menu.monsters.present?
      player.update(battle: Battle.create)
      redirect_to player.battle and return
    end

    case @menu.name

    when "パーティに加える"
      @choices = Pc.where(player_id: nil)

    when "パーティから外す"
      @choices = player.pcs

    when "新しいキャラクターを作る"
      @choices = 6.times.map{Pc.new}

    when "ボルタック商店"
      @choices = player.pcs
      @title = "誰が入店しますか"

    when /アイテムを買う/
      @choices = Item.all

    when /アイテムを売る/
      pc = Pc.find(session[:pc_id])
      @delete = true
      @choices = pc.equipments

    when "カント寺院"
      player.pcs.each do |pc|
        pc.update(state: "正常")
      end


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

    when "パーティに加える"
      Pc.find(params[:form][:id]).update(player: player)
      redirect_to @menu

    when "パーティから外す"
      Pc.find(params[:form][:id]).update(player_id: nil)
      redirect_to @menu

    when "新しいキャラクターを作る"
      Pc.create(params.require(:form).permit!)
      redirect_to @menu

    when "アイテムを買う"
      pc = Pc.find(session[:pc_id])
      item = Item.find(params[:form][:id])

      if pc.gp >= item.gp
        Equipment.create(pc: pc, item: item)
        pc.gp -= item.gp
        pc.save
        flash[:notice] = "#{item.name}をお買い上げで#{item.gp}gpになります。残りの所持金は#{pc.gp}gpですね。"
      else
        flash[:alert] = "この貧乏人が！（お金が足りませんよ）"
      end
      redirect_to @menu

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
      player.update(menu: @menu)
    end

end
