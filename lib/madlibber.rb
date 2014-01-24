require "madlibber/version"
require "engtagger"

module MadLibber

  extend self

  OPTIONS = {
    num_of_blanks: 10,
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

  TAGS_HTML = {
    "NN"  => "<input type='text' placeholder='noun' required>",
    "NNS" => "<input type='text' placeholder='plural_noun' required>",
    "NNP" => "<input type='text' placeholder='proper_noun' required>",
    "VB"  => "<input type='text' placeholder='verb' required>",
    "VBD" => "<input type='text' placeholder='verb_past_tense' required>",
    "VBG" => "<input type='text' placeholder='verb_ending_with_ing' required>",
    "JJ"  => "<input type='text' placeholder='adjective' required>",
    "RB"  => "<input type='text' placeholder='adverb' required>",
    "UH"  => "<input type='text' placeholder='interjection' required>"
  }

  def libberfy text, options = OPTIONS
    defaults = OPTIONS.merge options
    tgr = EngTagger.new
    tagged_text = tgr.get_readable(text)
    return unless tagged_text

    tag_word_pairs = tagged_text.split.map { |tagged_word| create_tag_word_pairs tagged_word }
    fillable_indices = find_fillable_indices(tag_word_pairs).shuffle.take defaults[:num_of_blanks]

    generate_output tag_word_pairs, fillable_indices, defaults[:html_form]
  end

  def generate_output tag_word_pairs, fillable_indices, html_form_flag
    output_array = tag_word_pairs.map.with_index do |tw_pair, index|
      if fillable_indices.include? index
        html_form_flag ? TAGS_HTML[ tw_pair[:tag] ] : TAGS[ tw_pair[:tag] ]
      else
        tw_pair[:word]
      end
    end

    if html_form_flag
      output_array.unshift "<form id='madlib-form'>"
      output_array << "<input type='submit'>"
      output_array << "</form>"
    end

    output_array.join(" ").gsub " '", "'"
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
