require "madlibber/version"
require "engtagger"

module MadLibber

  extend self

  OPTIONS = {
    num_of_blanks: 10
  }

  TAGS = {
    "NN"  => "<noun>",
    "NNS" => "<plural_noun>",
    "NNP" => "<proper_noun>",
    "VB"  => "<verb>",
    "VBD" => "<verb_past_tense>",
    "VBG" => "<verb_ending_with_ing>",
    "JJ"  => "<adjective>",
    "RB"  => "<adverb>",
    "UH"  => "<interjection>"
  }

  def libberfy text, options = OPTIONS
    defaults = OPTIONS
    defaults.merge! options
    tgr = EngTagger.new
    tag_word_pairs = tgr.get_readable(text).split.map { |tagged_word| create_tag_word_pairs tagged_word }
    fillable_indices = find_fillable_indices(tag_word_pairs).shuffle.take defaults[:num_of_blanks]

    tag_word_pairs.map.with_index do |tw_pair, index|
      (fillable_indices.include? index) ? TAGS[ tw_pair[:tag] ] : tw_pair[:word]
    end.join(" ").gsub " '", "'"
  end

  def create_tag_word_pairs word
    index = ( word =~ /\/\S*$/ )
    tag = word[(index + 1)..-1]
    word = word[0..(index - 1)]
    { word: word, tag: tag }
  end

  def find_fillable_indices tag_word_pairs
    fillable_indices = tag_word_pairs.map.with_index do |tw_pair, index|
      fillable_tag = TAGS[ tw_pair[:tag] ]
      fillable_tag ? index : nil
    end.compact!

    fillable_indices ? fillable_indices : []
  end

end


