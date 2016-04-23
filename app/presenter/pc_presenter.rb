class PcPresenter < ModelPresenter
  def abilities
    %w(str dex con int wis cha).map{|abi|@objext.send(abi)}
  end
end
