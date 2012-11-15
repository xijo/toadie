# Toadie

Toadie greps your (ruby) source code for TODO tags and associate them with your team members.

It's meant to be part of a CI process, so everyone should be able to find her/his open TODOs.

[![Build Status](https://secure.travis-ci.org/xijo/toadie.png?branch=master)](https://travis-ci.org/xijo/toadie)

## Features

 - grep rb, erb, haml, slim and feature files
 - uses git blame to find the author
 - configurable author tags associate TODO with persons in duty
 - provides html report

## Installation

Add this line to your application's Gemfile:

    gem 'toadie', require: false

And then execute:

    $ bundle

## Usage

Just run toadie in the root of your application:

    $ toadie

It will produce the html output into a folder called 'toadie', having a index.html file in there:

    $ open toadie/index.html

## Configure team members

By default you will not need to configure anything. Toadie will detect authors by using git and display TODOs accordingly.

However, to have multiple mail addresses or assignment tags for each team member create a `.toadie.json` file.

You can specify team members like this:

```json
{
  "authors": [
    {
      "name": "Jean-Luc Picard",
      "emails": ["jean-luc@tenforward.com", "picard@uss-enterprise.com"],
      "nicknames": ["captain", "picard", "jean-luc"]
    },
    {
      "name": "William T. Riker",
      "emails": ["riker@uss-enterprise.com"],
      "nicknames": ["riker", "will", "no1"]
    }
  ]
}
```

The given nicknames will be used to find TODOs assigned to this person. For example Picard writes:

```ruby
# TODO no1 meet me in my room
```

The TODO will be assigned to Riker.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Todos (haha)

1. Add customizable file endings to the configuration
2. Make output directory/format configurable
3. Do a little benchmarking and profiling
4. Refine descriptions and texts
5. Detect multiline TODOs
6. Support more languages
7. Link source to github
