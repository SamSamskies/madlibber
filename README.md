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
  are a a rapidly growing organization and our platform is used by
  people all over the world to raise money for their creative,
  cause-related, or entrepreneurial ideas. Our customers are
  passionate about their funding campaigns, and so are we! We are a
  team of passionate, results-driven, team-players who are lucky
  enough to be able to call “helping people achieve their dream”
  work. We love our dogs, good food, coffee, and post-it notes!
  Lots of post-it notes!"

MadLibber.libberfy text
```

By default, it generates a Mad Lib with 10 fillable fields if 10 fillable fields are available. The following example illustrates how you could specify how many fillable fields that you would like:

```ruby
require 'madlibber'

text = "At Indiegogo you’ll find a welcoming, supportive community
  that embraces collaboration, fearlessness and authenticity. We
  are a a rapidly growing organization and our platform is used by
  people all over the world to raise money for their creative,
  cause-related, or entrepreneurial ideas. Our customers are
  passionate about their funding campaigns, and so are we! We are a
  team of passionate, results-driven, team-players who are lucky
  enough to be able to call “helping people achieve their dream”
  work. We love our dogs, good food, coffee, and post-it notes!
  Lots of post-it notes!"

MadLibber.libberfy text, { num_of_blanks: 15 }
```

## Available fillable fields
Right now the following fillable fields randomly populate the Mad Lib.

```
<noun>, <plural_noun>, <proper_noun>, <verb>, <verb_past_tense>,
<adjective>, <adverb> and <interjection>
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
