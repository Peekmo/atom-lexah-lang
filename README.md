# Atom lexah-lang

This package provide some tools to use [lexah-lang](https://github.com/peekmo/lexah-lang) in [atom editor](https://atom.io/).

The grammar is modified from [language-ruby package](https://github.com/atom/language-ruby) from atom.

Feel free to modify it and add new features :)

# Autocomplete

This plugin provides a simple autocomplete feature (at least on local variables)
If it doesn't work, modify the settings of the package (in preferences -> package -> lexah-lang)

Two settings :
- Haxe command : Command to execute haxe through your command line. (default ```haxe```)
- Raxe command : Command to execute raxe (default ```haxelib run lexah```)

If it works, you'll see a ```.lexahcompletion``` folder in your project's folder
