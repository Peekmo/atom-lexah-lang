fs = require 'fs'
config = require "../config.coffee"

module.exports =
  options: []
  src: ""
  read: false

  ###*
   * Fetch options for haxe commands
   *
   * @param  {string} directory
   *
   * @return {Array}
  ###
  getOptions: (directory) ->
    path = directory + "/build.hxml"

    if not @read
      @options = []
      if fs.existsSync(path)
        content = fs.readFileSync(path, 'utf8')

        lines = content.split("\n")
        for line in lines
          if line.trim().startsWith("-lib")
            @options.push line

          # search haxelib run lexah to fill a correct package on projects
          else if line.trim().startsWith("-cmd #{config.config.lexah}")
            cmdElements = line.split(" ")
            nextIsSource = false
            for element in cmdElements
              if element == "-s" || element == "--src"
                nextIsSource = true
              else if nextIsSource
                element = if element.startsWith("/") then element.substring(1) else element
                @src = if not element.endsWith("/") then element + "/" else element
                break
      @read = true

    return @options
