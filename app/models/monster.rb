class Monster < ActiveRecord::Base
  belongs_to :menu

  def label
    "#{name} #{hp}hp"
  end

  def form_params
    key = model_name.param_key
    value = attributes.compact.except("created_at","updated_at")
    Hash[key,value]
  end

end
