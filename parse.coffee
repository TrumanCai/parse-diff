	s = ltrim s, '-'
	s = ltrim s, '+'

ltrim = (s, chars) ->
	s = makeString(s)
	return trimLeft.call(s) if !chars and trimLeft
	chars = defaultToWhiteSpace(chars)
	return s.replace(new RegExp('^' + chars + '+'), '')

makeString = (s) -> if s == null then '' else s + ''

trimLeft = String.prototype.trimLeft

defaultToWhiteSpace = (chars) ->
  return '\\s' if chars == null
  return chars.source if chars.source
  return '[' + escapeRegExp(chars) + ']'

escapeRegExp = (s) ->
	makeString(s).replace(/([.*+?^=!:${}()|[\]\/\\])/g, '\\$1')