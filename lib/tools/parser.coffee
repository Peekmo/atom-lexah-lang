module.exports =
  ###*
   * Returns all variables in the function
   *
   * @return {Array}
  ###
  getAllVariablesInFunction: (editor, bufferPosition) ->
    text = editor.getTextInBufferRange([[0, 0], bufferPosition])

    row = bufferPosition.row
    rows = text.split('\n')

    content = ''

    while row != -1
      line = rows[row].trim()

      if not line
        row--
        continue

      content = line + '\n' + content
      if line.match(/def[\s]+[a-zA-Z_0-9\.]+[\s]*[\(]/g)
        break

      content = line + '\n' + content
      row--

    reg = new RegExp("([a-zA-Z_0-9]+)[\\s]*[:=]{1}", "gm")
    result = []
    while matches = reg.exec(content)
      if matches[1]?
        result.push matches[1]

    return result

  ###*
   * Returns all classes imported in the current file
   *
   * @return {Array}
  ###
  getAllClassesImported: (editor, bufferPosition) ->
    text = editor.getTextInBufferRange([[0, 0], bufferPosition])

    reg = new RegExp("require [\"\']{1}[\\s]*([a-zA-Z_0-9\./]+)[\\s]*[\"\']{1}", "gm")
    result = []
    while matches = reg.exec(text)
      if matches[1]?
        result.push matches[1].split("/").pop()

    return result
