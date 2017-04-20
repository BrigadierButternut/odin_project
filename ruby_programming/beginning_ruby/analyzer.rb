lines = File.readlines(ARGV[0])
line_count = lines.size
text = lines.join
total_characters = text.length
total_characters_nospaces = text.gsub(/\s+/,"").length
word_count = text.split.length
paragraph_count = text.split(/\n\n/).length
sentence_count = text.split(/\.|\?|!/).length

stopwords = %w{the a by on for of are with just but and to the my I has some in}
all_words = text.scan(/\w+/)
keywords = all_words.select {|word| !stopwords.include?(word)}
percent_keywords = ((keywords.length.to_f/all_words.length.to_f)*100).to_i

sentences = text.gsub(/\s+/,' ').strip.split(/\.|\?|!/)
sentences_sorted = sentences.sort_by {|sentence| sentence.length}
one_third = sentences_sorted.length / 3
ideal_sentences = sentences_sorted.slice(one_third,one_third+1)
ideal_sentences = ideal_sentences.select {|sentence| sentence =~ /is|are/}


puts "#{line_count} lines"
puts "#{total_characters} characters"
puts "#{total_characters_nospaces} characters (excluding spaces)"
puts "#{word_count} words"
puts "#{paragraph_count} paragraphs"
puts "#{sentence_count} sentances"
puts "#{sentence_count/paragraph_count} sentances per paragraph (average)"
puts "#{word_count/sentence_count} words per sentence (average)"
puts "#{percent_keywords}% of words are non-fluff words"
puts "Summary:\n\n" + ideal_sentences.join(". ")
puts "--End of analysis"
