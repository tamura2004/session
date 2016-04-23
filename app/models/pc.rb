class Pc < Character
  belongs_to :party

  scope :noparty, -> {
    where("party_id is null")
  }

  def hp_bonus
    (con - 10) / 2
  end

  def abilities
    attributes.slice("str","dex","con","int","wis","cha").map do |k,v|
      [Pc.human_attribute_name(k),v].join(":")
    end.join(" ")
  end

  def changed_attributes_label
    changed_attributes.map do |key,value|
      "#{Pc.human_attribute_name(key)}:#{value}"
    end.join(" ")
  end

end
