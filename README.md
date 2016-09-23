# p6-Texas

An attempt to keep track of Perl6's unicode operators and their Texas versions
and to create tools to create Input Method Editor (IME) configuration files to
make inputting these unicode operators easier.

If possible, one should be able to type `=~=` and get `≅`. Roughly.

## General

See the Perl6 documentation section on [unicode entry][1].

## XCompose

See specifically the XCompose section of the Perl6 documentation on [unicode entry / XCompose][2].

With the XCompose input method one hits the `Compose` key, then types a
sequence of characters which magically get replaced with some other character.

The default configuration of XCompose provides many mappings, and additional
XCompose configurations provide many more.  The intent here is to provide
mappings that match Perl6's Texas versions.

So you can type `Compose` + `(elem)` and get `∈`.

### xcompose.p6

The `xcompose.p6` script takes a list of `unicode <=> texas_variant` mappings
and creates a XCompose configuration file.

```
./xcompose.p6 < perl.texas > ~/.XCompose.perl6
```

## Example Setup

I like to keep my XCompose configuration in multiple files.  XCompose has
an `include` pragma that makes this easy.  Take a look at the `XCompose` file
in this repo for details.

I like to copy the default configuration for my locale to my `$HOME` instead
of just `include`-ing to make it easier to search.

```
cp /usr/shar/X11/locale/en_US.UTF-8/Compose ~/.XCompose.en_US.UTF-8
```

As mentioned in the Perl6 documentaton mentioned above... there is a [rather
neat configuration][3] file with tons of mappings that I also like to use.
(Note: removing the `include` since I handle it myself later on.)

```
wget -O- \
 https://raw.githubusercontent.com/kragen/xcompose/master/dotXCompose \
 | sed '/^include/d' > ~/.XCompose.kragen
```

Then there's the Perl6 specific stuff.

```
./xcompose.p6 < perl.texas > ~/.XCompose.perl6
```

And other things can go in `~/.XCompose.local`.

Then my `~/.XCompose` looks something like this:

```
include "%H/.XCompose.en_US.UTF-8"
include "%H/.XCompose.kragen"
include "%H/.XCompose.perl6"
include "%H/.XCompose.local"
```

See the actual `XCompose` in this repo for a few more comments. And maybe edit
and:

```
cp XCompose ~/.XCompose
```


## TODO

* other input methods
* point out other unicode things in Perl6 that are not really Texas like `×` and `÷` and `∘`.
* restarting `ibus` or logout/login to pick up changes... such a PITA.

[1]: https://docs.perl6.org/language/unicode_entry
[2]: https://docs.perl6.org/language/unicode_entry#XCompose
[3]: https://github.com/kragen/xcompose


