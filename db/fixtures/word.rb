require "pathname"

@id = 0
def id
  puts @id
  @id += 1
end

def filepath(filename)
  Pathname(File.join(Rails.root,"db/fixtures/txt","#{filename}.txt"))
end

def to_model(filename)
  words = filename.split(/_/)
  words[1..2].join("_").camelize.constantize
end

FILES = [
#  [false,false,false,false,"word_handle_after"],
#  [false,false,false,false,"word_handle_before"],
  [true,false,false,true,"word_given_name_kana_female"],
  [true,false,true,true,"word_given_name_kana_newtral"],
  [true,false,true,false,"word_given_name_kana_male"]
]

FILES.each do |file|
  kana,kanji,male,female,filename = file
  filepath(filename).each_line do |name|
    to_model(filename).seed do |s|
      s.id = id
      s.name = name.chomp
      s.is_kana = kana
      s.is_kanji = kanji
      s.is_male = male
      s.is_female = female
    end
  end
end
