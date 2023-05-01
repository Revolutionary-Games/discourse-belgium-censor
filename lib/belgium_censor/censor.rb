# frozen_string_literal: true

require_relative 'bad_words'

module ::BelgiumCensorPluginModule

  REPLACING_WORD = "belgium"

  class Censor
    def initialize
      super

      all_words = SIMPLE_BAD_WORDS + MULTIWORD_BAD_WORDS

      @combined_regex = Regexp.new(
        (all_words.map { |w| Regexp.escape(w) } + REGEX_BAD_WORDS).join('|'),
        Regexp::IGNORECASE)
    end

    def filter(text)
      text.gsub(@combined_regex) { |_| REPLACING_WORD }
    end
  end
end
