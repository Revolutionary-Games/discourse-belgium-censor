# frozen_string_literal: true

require_relative "bad_words"

module ::BelgiumCensorPluginModule
  REPLACING_WORD = "belgium"

  class Censor
    def initialize
      super

      all_words = SIMPLE_BAD_WORDS + MULTIWORD_BAD_WORDS

      @combined_regex =
        Regexp.new(
          (all_words.map { |w| Regexp.escape(w) } + REGEX_BAD_WORDS).join("|"),
          Regexp::IGNORECASE,
        )
    end

    def filter(text)
      original = text

      # preprocess by removing non-printing characters
      text_without_non_printing = text.gsub(/[\u200B-\u200D\uFEFF]/, '')

      # apply the bad words filter list
      filtered = text_without_non_printing.gsub(@combined_regex) { |_| REPLACING_WORD }

      if filtered != text_without_non_printing
        filtered
      else
        # If no changes, let original text through
        original
      end
    end
  end
end
