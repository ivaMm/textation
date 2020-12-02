require "textation/version"

module Textation
  class Text
    def self.analyze_file(file_name)
      text = File.open(file_name, 'r').read
      stop_words = File.open('data/stop_words.txt', 'r').read.split(/\b/)
      useful_words = text.downcase.split(/\b/).delete_if { |word| stop_words.include?(word) || word.match?(/\W/) }.length
      result = analyze(text)
      result[:percentage_useful_words] = (useful_words.to_f / result[:word_count]).round(1) * 100
      result
    end

    def self.analyze(text)
      result = {}
      result[:character_count] = text.length
      result[:character_count_excluding_spaces] = text.gsub(/\s/, '').length
      result[:line_count] = text.split(/\r\n/).length
      result[:word_count] = text.split(' ').length
      result[:sentence_count] = text.split(/\w{2,}\.\s?\r?\n?[[:upper:]]|\?\!|\?|\!/).length
      result[:paragraph_count] = text.split(/\r\n\r\n/).length
      result[:average_words_per_sentence] = (result[:word_count].to_f / result[:sentence_count]).round(1)
      result[:average_sentences_per_paragraph] = (result[:sentence_count].to_f / result[:paragraph_count]).round(1)
      result
    end
  end
end
