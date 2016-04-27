@id = 0
def id
  @id += 1
end

%w(秩序 中立 混沌).each do |x|
  %w(善 中立 悪).each do |y|
    Alignment.seed do |s|
      s.id = id
      if x == y
        s.name = "真なる中立"
      else
        s.name = "#{x}にして#{y}"
      end
    end
  end
end

