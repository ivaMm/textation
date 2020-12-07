require "textation/version"

#module Textation
  class Text
    #extend Textation

    def analyze_file(text_file)
      text = File.open(text_file, 'r').read
      analyze(text)
    end

    def analyze(text)
      result = {}
      result[:character_count] = text.length
      result[:character_count_excluding_spaces] = text.gsub(/\s/, "").length
      result[:letter_count] = text.gsub(/[^[:alpha:]]/, "").length
      result[:line_count] = text.split(/\n/).length
      result[:word_count] = text.split(/\W+/).delete_if(&:empty?).length
      result[:sentence_count] = text.split(/[^[:alpha:]{1}\.]\.{1,3}\s?\r?\n?|\?+|!+|\?!+|!\?+/).length
      result[:paragraph] = text.split(/\n\n/)
      result[:paragraph_count] = result[:paragraph].length
      result[:lines_per_paragraph] = result[:paragraph].map { |p| p.split(/\n/).length }
      result[:syllables_per_line] = syllables_per_line(text)
      result[:average_words_per_sentence] = (result[:word_count].to_f / result[:sentence_count]).round(2)
      result[:average_sentences_per_paragraph] = (result[:sentence_count].to_f / result[:paragraph_count]).round(2)
      result[:useful_words] = useful_words(text)
      result[:percentage_of_useful_words] = ((result[:useful_words].length.to_f / result[:word_count]) * 100).round(2)
      result[:unique_words] = text.downcase.split(/[^[[:alpha:]]]/).select { |w| w.length >= 1 }.uniq
      result[:percentage_of_unique_words] = ((result[:unique_words].length.to_f / result[:word_count]) * 100).round(2)
      result[:occurences_of_words] = occurences_of_words(text)
      result[:percentage_of_words] = percentage_of_words(text)
      result
    end

    def useful_words(text)
      stop_words = File.open('data/stop_words.txt', 'r').read.split(/\n/)
      text.downcase
          .split(/\W+/)
          .delete_if { |w| stop_words.include?(w) }
          .select { |w| w.length >= 1 }
          .uniq
    end

    def top_words_no_stop_words(text, num = 3)
      text = useful_words(text)
      top_words(text, num)
    end

    def top_words_all(text, num = 3)
      text = text.downcase.split(/\W+/)
      top_words(text, num)
    end

    def top_words(text, num)
      text.group_by(&:itself)
          .transform_values(&:count)
          .sort_by { |_k, v| -v }
          .first(num)
          .map(&:first).join(', ')
    end

    def occurences_of_words(text)
      text.downcase
          .split(/\W+/)
          .delete_if(&:empty?)
          .group_by(&:itself)
          .transform_values(&:count)
          .sort_by { |_k, v| -v }
          .to_h
    end

    def occurence_of_word(text, word)
      occurences_of_words(text)[word.downcase]
    end

    def percentage_of_words(text)
      occurences = occurences_of_words(text)
      len = text.split(/\W+/).length
      occurences.transform_values { |v| ((v.to_f / len) * 100).round(2) }
    end

    def percentage_of_word(text, word)
      percentage_of_words(text)[word.downcase]
    end

    def syllables_per_line(text)
      text.downcase.split(/\n/).map do |line|
        line.split(/\W+/).map do |word|
          if word.split(/[^aeiouy]+/).delete_if(&:empty?).length > 1
            word.gsub(/e$|e{1}[a-z&&[^aeiou]*]$/, "").split(/[^aeiouy]+/).delete_if(&:empty?).length
          else
            word.split(/[^aeiouy]+/).delete_if(&:empty?).length
          end
        end
      end.map(&:sum)
    end
  end
#end
