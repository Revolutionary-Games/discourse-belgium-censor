# frozen_string_literal: true

# Warning: similarly to the censor file this file contains bad words to test that they are
# filtered correctly. So if you are offended by such things DO NOT READ THIS FILE FURTHER!

require "minitest/autorun"

require_relative "../../lib/belgium_censor/censor"

COMMON_FALSE_POSITIVES = [
  "grape",
  "hiding spot",
  "transmutation",
  "therapist",
  "margay",
  "theocracy",
]

TEXT_THAT_NEEDS_FILTERING = ["g-spot", "g spot", "rape", "gay"]

class CensorTest < Minitest::Test
  def setup
    @censor = BelgiumCensorPluginModule::Censor.new
  end

  def teardown
    # Do nothing
  end

  def test_filter_bad_words
    TEXT_THAT_NEEDS_FILTERING.each do |word|
      assert @censor.filter(word) != word, "bad word '#{word}' didn't filter"
    end
  end

  def test_filter_no_false_positives
    COMMON_FALSE_POSITIVES.each { |word| assert_equal word, @censor.filter(word) }
  end
end
