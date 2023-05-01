# frozen_string_literal: true

require_relative 'bad_words'

module ::BelgiumCensorPluginModule

  REPLACING_WORD = "belgium"

  class Censor
    def initialize
      super
      @combined_regex = Regexp.new(SIMPLE_BAD_WORDS.map { |w| Regexp.escape(w) }.join('|'),
                                   Regexp::IGNORECASE)
    end

    def filter(text)
      text.gsub(@combined_regex) { |_| REPLACING_WORD }
    end
  end
end
