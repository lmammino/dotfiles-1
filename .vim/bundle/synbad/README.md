Synbad
======

Toggle multiple syntaxes in Vim using .syntax file and ctrl-s.

Say you have a file that Vim thinks is HTML but you want to treat it as PHP or Liquid or ERB. Create a file at the root of your project called .syntax and enter file types in it.

### Key mappings

Ctrl-s to cycle through any file types listed in .syntax file.

When you've cycled through the available options, ctrl-s will return to default filetype.
