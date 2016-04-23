class PcPresenter < ModelPresenter
  def abilities
    slice(:str,:dex,:con,:int,:wis,:cha).map{ |k,v|
      [Pc.human_attribute_name(k),v].join(":")
    }.join(" ")
  end



end
