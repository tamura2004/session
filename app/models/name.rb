class Name < ActiveRecord::Base
  include SampleScopes
  self.inheritance_column = nil

  scope :word, -> {
    find(ids.sample).word
  }

  scope :handle, -> {
    handle_before.word + handle_after.word
  }

  scope :random_name, -> {
    case rand(4)
    when 0
      "#{ename} #{myoji.word}"
    when 1
      "#{myoji.word} #{ename}"
    when 2
      "#{myoji.word} #{ename} #{jname.word}"
    when 3
      "#{ename} #{jname.word}"
    end
  }


  scope :ename, -> {
    first_word.word + middle_word.word + last_word.word
  }

  scope :handle_before, -> {
    where type: :HANDLE_BEFORE
  }

  scope :handle_after, -> {
    where type: :HANDLE_AFTER
  }

  scope :myoji, -> {
    where type: [
      "JAPAN_KANA_FAMILY_NAMES",
      "JAPAN_FAMILY_NAMES",
      "JUNIOR_WORDS"
      ]
  }

  scope :jname, -> {
    where type: [
      "JAPAN_MALE_NAMES",
      "JAPAN_KANA_MALE_NAMES",
      "JAPAN_FEMALE_NAMES",
      "JAPAN_KANA_FEMALE_NAMES"
    ]
  }

  scope :first_word, -> {
    where type: [
      "MALE_FIRST",
      "FEMALE_FIRST"
    ]
  }

  scope :middle_word, -> {
    where type: [
      "MALE_MIDDLE",
      "FEMALE_MIDDLE"
    ]
  }

  scope :last_word, -> {
    where type: [
      "MALE_LAST",
      "FEMALE_LAST"
    ]
  }

  scope :male, -> {
    where type: [
      "MALE_FIRST",
      "MALE_MIDDLE",
      "MALE_LAST",
      "JAPAN_MALE_NAMES",
      "JAPAN_KANA_MALE_NAMES",
      "JAPAN_KANA_FAMILY_NAMES",
      "JAPAN_FAMILY_NAMES",
      "JUNIOR_WORDS"
    ]
  }

  scope :female, -> {
    where type: [
      "FEMALE_FIRST",
      "FEMALE_MIDDLE",
      "FEMALE_LAST",
      "JAPAN_FEMALE_NAMES",
      "JAPAN_KANA_FEMALE_NAMES",
      "JAPAN_KANA_FAMILY_NAMES",
      "JAPAN_FAMILY_NAMES",
      "JUNIOR_WORDS"
    ]
  }

end
