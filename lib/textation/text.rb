require "textation/version"

STOP_WORDS = ["a", "a's", "able", "about", "above", "according", "accordingly", "across", "actually", "after", "afterwards", "again", "against", "ain't", "all", "allow", "allows", "almost", "alone", "along", "already", "also", "although", "always", "am", "among", "amongst", "an", "and", "another", "any", "anybody", "anyhow", "anyone", "anything", "anyway", "anyways", "anywhere", "apart", "appear", "appreciate", "appropriate", "are", "aren't", "around", "as", "aside", "ask", "asking", "associated", "at", "available", "away", "awfully", "b", "be", "became", "because", "become", "becomes", "becoming", "been", "before", "beforehand", "behind", "being", "believe", "below", "beside", "besides", "best", "better", "between", "beyond", "both", "brief", "but", "by", "c", "c'mon", "c's", "came", "can", "can't", "cannot", "cant", "cause", "causes", "certain", "certainly", "changes", "clearly", "co", "com", "come", "comes", "concerning", "consequently", "consider", "considering", "contain", "containing", "contains", "corresponding", "could", "couldn't", "course", "currently", "d", "definitely", "described", "despite", "did", "didn't", "different", "do", "does", "doesn't", "doing", "don't", "done", "down", "downwards", "during", "e", "each", "edu", "eg", "eight", "either", "else", "elsewhere", "enough", "entirely", "especially", "et", "etc", "even", "ever", "every", "everybody", "everyone", "everything", "everywhere", "ex", "exactly", "example", "except", "f", "far", "few", "fifth", "first", "five", "followed", "following", "follows", "for", "former", "formerly", "forth", "four", "from", "further", "furthermore", "g", "get", "gets", "getting", "given", "gives", "go", "goes", "going", "gone", "got", "gotten", "greetings", "h", "had", "hadn't", "happens", "hardly", "has", "hasn't", "have", "haven't", "having", "he", "he's", "hello", "help", "hence", "her", "here", "here's", "hereafter", "hereby", "herein", "hereupon", "hers", "herself", "hi", "him", "himself", "his", "hither", "hopefully", "how", "howbeit", "however", "i", "i'd", "i'll", "i'm", "i've", "ie", "if", "ignored", "immediate", "in", "inasmuch", "inc", "indeed", "indicate", "indicated", "indicates", "inner", "insofar", "instead", "into", "inward", "is", "isn't", "it", "it'd", "it'll", "it's", "its", "itself", "j", "just", "k", "keep", "keeps", "kept", "know", "knows", "known", "l", "last", "lately", "later", "latter", "latterly", "least", "less", "lest", "let", "let's", "like", "liked", "likely", "little", "look", "looking", "looks", "ltd", "m", "mainly", "many", "may", "maybe", "me", "mean", "meanwhile", "merely", "might", "more", "moreover", "most", "mostly", "much", "must", "my", "myself", "n", "name", "namely", "nd", "near", "nearly", "necessary", "need", "needs", "neither", "never", "nevertheless", "new", "next", "nine", "no", "nobody", "non", "none", "noone", "nor", "normally", "not", "nothing", "novel", "now", "nowhere", "o", "obviously", "of", "off", "often", "oh", "ok", "okay", "old", "on", "once", "one", "ones", "only", "onto", "or", "other", "others", "otherwise", "ought", "our", "ours", "ourselves", "out", "outside", "over", "overall", "own", "p", "particular", "particularly", "per", "perhaps", "placed", "please", "plus", "possible", "presumably", "probably", "provides", "q", "que", "quite", "qv", "r", "rather", "rd", "re", "really", "reasonably", "regarding", "regardless", "regards", "relatively", "respectively", "right", "s", "said", "same", "saw", "say", "saying", "says", "second", "secondly", "see", "seeing", "seem", "seemed", "seeming", "seems", "seen", "self", "selves", "sensible", "sent", "serious", "seriously", "seven", "several", "shall", "she", "should", "shouldn't", "since", "six", "so", "some", "somebody", "somehow", "someone", "something", "sometime", "sometimes", "somewhat", "somewhere", "soon", "sorry", "specified", "specify", "specifying", "still", "sub", "such", "sup", "sure", "t", "t's", "take", "taken", "tell", "tends", "th", "than", "thank", "thanks", "thanx", "that", "that's", "thats", "the", "their", "theirs", "them", "themselves", "then", "thence", "there", "there's", "thereafter", "thereby", "therefore", "therein", "theres", "thereupon", "these", "they", "they'd", "they'll", "they're", "they've", "think", "third", "this", "thorough", "thoroughly", "those", "though", "three", "through", "throughout", "thru", "thus", "to", "together", "too", "took", "toward", "towards", "tried", "tries", "truly", "try", "trying", "twice", "two", "u", "un", "under", "unfortunately", "unless", "unlikely", "until", "unto", "up", "upon", "us", "use", "used", "useful", "uses", "using", "usually", "uucp", "v", "value", "various", "very", "via", "viz", "vs", "w", "want", "wants", "was", "wasn't", "way", "we", "we'd", "we'll", "we're", "we've", "welcome", "well", "went", "were", "weren't", "what", "what's", "whatever", "when", "whence", "whenever", "where", "where's", "whereafter", "whereas", "whereby", "wherein", "whereupon", "wherever", "whether", "which", "while", "whither", "who", "who's", "whoever", "whole", "whom", "whose", "why", "will", "willing", "wish", "with", "within", "without", "won't", "wonder", "would", "wouldn't", "x", "y", "yes", "yet", "you", "you'd", "you'll", "you're", "you've", "your", "yours", "yourself", "yourselves", "z", "zero"]


class Text
  def analyze(text)
    text = check_input(text)
    result = {}
    result[:character_count] = text.length
    result[:character_count_excluding_spaces] = text.gsub(/\s/, '').length
    result[:letter_count] = text.gsub(/[^[:alpha:]]/, '').length
    result[:line_count] = text.split(/\n/).length
    result[:word_count] = text.split(/\W+/).delete_if(&:empty?).length
    result[:sentence_count] = text.split(/[^[:alpha:]{1}\.]\.{1,3}\s?\r?\n?|\?+|!+|\?!+|!\?+/).length
    result[:paragraph_count] = text.split(/\n\n/).length
    result[:lines_per_paragraph] = text.split(/\n\n/).map { |p| p.split(/\n/).length }.join(', ')
    result[:syllables_per_line] = syllables_per_line(text).join(', ')
    result[:average_words_per_sentence] = (result[:word_count].to_f / result[:sentence_count]).round(2)
    result[:average_sentences_per_paragraph] = (result[:sentence_count].to_f / result[:paragraph_count]).round(2)
    result[:useful_words] = useful_words(text).join(', ')
    result[:percentage_of_useful_words] = ((result[:useful_words].split(/\W+/).length.to_f / result[:word_count]) * 100).round(2)
    result[:occurences_of_words] = occurences_of_words(text).to_a.map {|el| "#{el[0]}: #{el[1]}" }.join(', ')
    result[:percentage_of_words] = percentage_of_words(text).to_a.map {|el| "#{el[0]}: #{el[1]}" }.join(', ')
    result[:unique_words] = text.downcase.split(/\W+/).select { |w| w.length >= 1 }.uniq.join(', ') # result[:occurences_of_words].select { |_k, v| v == 1 }.keys
    result[:percentage_of_unique_words] = ((result[:unique_words].split(/\W+/).length.to_f / result[:word_count]) * 100).round(2)
    result
  end

  def useful_words(text)
    text = check_input(text)
    text.downcase
        .split(/\W+/)
        .delete_if { |w| STOP_WORDS.include?(w) }
        .select { |w| w.length >= 1 }
        .uniq
  end

  def top_words_no_stop_words(text, num = 3)
    text = useful_words(text)
    top_words(text, num)
  end

  def top_words_all(text, num = 3)
    text = (check_input(text)).downcase.split(/\W+/)
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
    text = check_input(text)
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
    len = check_input(text).split(/\W+/).length
    occurences.transform_values { |v| ((v.to_f / len) * 100).round(2) }
  end

  def percentage_of_word(text, word)
    percentage_of_words(text)[word.downcase]
  end

  def syllables_per_line(text)
    text.downcase.split(/\n/).map do |line|
      line.split(/\W+/).map do |word|
        if word.split(/[^aeiouy]+/).delete_if(&:empty?).length > 1
          word.gsub(/e$|es$|ed$/, "").split(/[^aeiouy]+/).delete_if(&:empty?).length
        else
          word.split(/[^aeiouy]+/).delete_if(&:empty?).length
        end
      end
    end.map(&:sum)
  end

  def check_input(text)
    text.match?(/.txt$/) ? File.open(text, 'r').read : text
  end
end
