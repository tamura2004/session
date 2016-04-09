class Pc < ActiveRecord::Base
  has_many :pc_skills
  has_many :skills, through: :pc_skills

  before_validation do
    self.handle = hex2utf8(handle) if hex?(handle)
    self.name = hex2utf8(name) if hex?(name)
  end

  def full_name
    "“#{handle}” #{name}"
  end

  def male?
    gender == "male"
  end

  def names_candidate
    candidate = Array.new(3) do
      names = male? ? Name.male : Name.female
      utf8_with_hex(names.random_name)
    end
  end

  def handles_candidate
    candidate = Array.new(3) do
      utf8_with_hex(Name.handle)
    end
  end

  private

  def hex2utf8(hex)
    [hex].pack("H*").force_encoding("utf-8")
  end

  def hex?(str)
    str && str =~ /^[0-9a-zA-Z]+$/
  end

  def utf8_with_hex(utf8)
    [utf8, utf8.unpack("H*").first]
  end

end
