class Pc < Character
  belongs_to :party

  scope :noparty, -> {
    where("party_id is null")
  }

  def stat
    ret = []
    attributes.each do |k,v|
      next if v.nil?
      next if k == "id"
      next if k == "type"
      next if k =~ /_at/
      k = Pc.human_attribute_name(k)
      ret << "【#{k}】#{v}"
    end
    ret.join("")
  end

end
