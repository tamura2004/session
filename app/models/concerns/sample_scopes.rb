module SampleScopes
  extend ActiveSupport::Concern
  included do
    scope :sample, -> n {
      where id: ids.sample(n)
    }
  end
end
