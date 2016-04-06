class Pc < ActiveRecord::Base
  belongs_to :handle
  belongs_to :pc_name
  has_many :pc_skills
  has_many :skills, through: :pc_skills

  def name
    "“#{handle.name}” #{pc_name.name}"
  end
end
