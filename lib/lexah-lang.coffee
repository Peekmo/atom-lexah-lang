{CompositeDisposable} = require 'atom'
config = require './config.coffee'
proxy = require './tools/proxy.coffee'

AutocompleteProvider = require './provider/autocomplete-provider.coffee'
VariableProvider = require './provider/variable-provider.coffee'


module.exports = LexahLang =
  config:
    haxe:
      title: 'Haxe command'
      description: 'Command to use haxe'
      type: 'string'
      default: 'haxe'
      order: 1

    lexah:
      title: 'Lexah command'
      description: 'Command to use lexah CLI'
      type: 'string'
      default: 'haxelib run lexah'
      order: 2

  providers: []

  activate: (state) ->
    config.init()

    @providers.push new AutocompleteProvider()
    @providers.push new VariableProvider()

  deactivate: ->
    proxy.kill()

  provide: ->
    return @providers
