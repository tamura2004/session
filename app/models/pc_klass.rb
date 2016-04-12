class PcKlass < ActiveRecord::Base
  include SampleScopes
  belongs_to :pc
  belongs_to :klass
  delegate :name, to: :klass

  attr_accessor :klass_ids

end
