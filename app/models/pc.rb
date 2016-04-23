class Pc < Character
  belongs_to :party

  scope :noparty, -> {
    where("party_id is null")
  }

  def hp_bonus
    (con - 10) / 2
  end

end
