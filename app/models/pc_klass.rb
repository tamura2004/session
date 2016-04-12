class PcKlass < ActiveRecord::Base
  include SampleScopes
  belongs_to :pc
  belongs_to :klass

  attr_accessor :klass_ids

  def name
    klass.name
  end
end
