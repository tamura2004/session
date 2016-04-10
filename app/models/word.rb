class Word < ActiveRecord::Base
  include SampleScopes
  scope :male, -> { where(is_male: true) }
  scope :female, -> { where(is_female: true) }
  scope :kana, -> { where(is_kana: true) }
  scope :kanji, -> { where(is_kanji: true) }
end
