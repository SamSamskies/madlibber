# MadLibber

Ruby gem that can convert any body of text into a Mad Lib.

## Installation

Add this line to your application's Gemfile:

    gem 'madlibber'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install madlibber

## Usage
```ruby
require 'madlibber'

text = "At Indiegogo you’ll find a welcoming, supportive community
  that embraces collaboration, fearlessness and authenticity. We
  are a rapidly growing organization and our platform is used by
  people all over the world to raise money for their creative,
  cause-related, or entrepreneurial ideas. Our customers are
  passionate about their funding campaigns, and so are we! We are a
  team of passionate, results-driven, team-players who are lucky
  enough to be able to call “helping people achieve their dream”
  work. We love our dogs, good food, coffee, and post-it notes!
  Lots of post-it notes!"

MadLibber.libberfy text
```
EXAMPLE OUTPUT:
```
At Indiegogo you'll find a welcoming , supportive community that
embraces collaboration , fearlessness and authenticity . We are a
rapidly growing organization and our <noun> is used by people all
over the world to raise money for their <adjective> , cause-related ,
or <adjective> ideas . Our customers are passionate about their
funding <plural_noun> , and <adverb> are we ! We are a team of
passionate , <adjective> , team-players who are lucky enough to be
<adjective> to call helping people achieve their dream <noun> . We
love our dogs , good food , <noun> , and post-it notes ! <plural_noun>
of post-it notes !
```

###OPTIONS
```
num_of_blanks (defaults to 10)
html_form (defaults to false)
```

The following example illustrates how you could specify how many fillable fields that you would like and that you want response as an HTML form:

```ruby
require 'madlibber'

text = "At Indiegogo you’ll find a welcoming, supportive community
  that embraces collaboration, fearlessness and authenticity. We
  are a rapidly growing organization and our platform is used by
  people all over the world to raise money for their creative,
  cause-related, or entrepreneurial ideas. Our customers are
  passionate about their funding campaigns, and so are we! We are a
  team of passionate, results-driven, team-players who are lucky
  enough to be able to call “helping people achieve their dream”
  work. We love our dogs, good food, coffee, and post-it notes!
  Lots of post-it notes!"

MadLibber.libberfy text, { num_of_blanks: 15, html_form: 1 }
```
EXAMPLE OUTPUT:
```html
<form id='madlib-form'>
At Indiegogo you'll <input type='text' placeholder=''verb> a
welcoming , supportive community that embraces collaboration ,
fearlessness and <input type='text' placeholder='noun'> . We are a
<input type='text' placeholder='adverb'> growing organization and
our platform is used by people all over the <input type='text'
placeholder='noun'> to <input type='text' placeholder='verb'>
<input type='text' placeholder='noun'> for their <input type='text'
placeholder='adjective'> , <input type='text' placeholder='adjective'> ,
or entrepreneurial ideas . Our <input type='text'
placeholder='plural_noun'> are passionate about their funding
campaigns , and <input type='text' placeholder='adverb'> are we !
We are a team of passionate , <input type='text'
placeholder='adjective'> , <input type='text' placeholder='noun'> who
are lucky enough to be able to call helping people achieve their dream
work . We love our dogs , good food , <input type='text'
placeholder='noun'> , and post-it <input type='text'
placeholder='plural_noun'> ! Lots of post-it <input type='text'
placeholder='plural_noun'> !
</form>
```

## Available fillable fields
Right now the following fillable fields randomly populate the Mad Lib.

```
<noun>, <plural_noun>, <proper_noun>, <verb>, <verb_past_tense>,
<verb_ending_with_ing>, <adjective>, <adverb> and <interjection>
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
