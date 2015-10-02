module.exports =
  config: {}

  ###*
   * Get plugin configuration
  ###
  init: () ->
    # See also https://secure.php.net/urlhowto.php .
    @config['haxe'] = atom.config.get('lexah-lang.haxe')
    @config['lexah'] = atom.config.get('lexah-lang.lexah')

    atom.config.onDidChange 'lexah-lang.haxe', () =>
      @init()

    atom.config.onDidChange 'lexah-lang.lexah', () =>
      @init()
