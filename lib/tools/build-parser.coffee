fs = require 'fs'

module.exports =
  options: []
  read: false

  getOptions: (directory) =>
    path = directory + "/build.hxml"

    if not @read
      @options = []
      if fs.existsSync(path)
        content = fs.readFileSync(path, 'utf8')
        console.log content
        lines = content.split("\n")
        for line in lines
          if line.trim().startsWith("-lib") || line.trim().startsWith("-cp")
            @options.push line
      @read = true

    return @options
