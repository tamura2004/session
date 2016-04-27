class Pc < Character
  belongs_to :party
  has_one :ability

  scope :noparty, -> {
    where("party_id is null")
  }

end
