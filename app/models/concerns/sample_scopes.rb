module SampleScopes
  extend ActiveSupport::Concern
  included do
    scope :sample, -> n {
      where id: ids.sample(n)
    }
    scope :choose, -> {
      find(ids.sample)
    }
  end
end
