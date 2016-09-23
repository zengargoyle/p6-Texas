#!/usr/bin/env perl6
#
# filter lines of 'unicode_char texas_string' into XCompose format
#

# keysym from: /usr/share/X11/xkb/symbols/us
# there are more of these, but i think this pretty much
# covers the ASCII that texas can use.

my %keysym =
  '`' => 'grave',
  '~' => 'asciitilde',
  '!' => 'exclam',
  '@' => 'at',
  '#' => 'numbersign',
  '$' => 'dollar',
  '%' => 'percent',
  '^' => 'asciicircum',
  '&' => 'ampersand',
  '*' => 'asterisk',
  '(' => 'parenleft',
  ')' => 'parenright',
  '-' => 'minus',
  '_' => 'underscore',
  '=' => 'equal',
  '+' => 'plus',
  '[' => 'bracketleft',
  '{' => 'braceleft',
  ']' => 'bracketright',
  '}' => 'braceright',
  ';' => 'semicolon',
  ':' => 'colon',
  '\'' => 'apostrophe',
  '"' => 'quotedbl',
  ',' => 'comma',
  '<' => 'less',
  '.' => 'period',
  '>' => 'greater',
  '/' => 'slash',
  '?' => 'question',
  '\\' => 'backslash',
  '|' => 'bar',
;

#
# should probably put a MAIN() here and process some args (prefix)
#

my @prefix = « <Multi_key> »;

for lines».split( / \s+ / ) -> ($unichar, $texas) {

  # convert texas characters into sequence of <keysym>
  my @keys = $texas.comb.map({
    .trans: %keysym.keys.Array => %keysym.values.Array;
  }).fmt("<%s>");

  # mostly for commenting purposes
  #
  # unicode code point
  my $unicode = $unichar.ord.fmt("U%X");

  # unicode name
  my $uniname = $unichar.uninames();

  say qq {# $unichar $texas};
  say qq {@prefix[] @keys[] : "$unichar" $unicode # $uniname};
}

