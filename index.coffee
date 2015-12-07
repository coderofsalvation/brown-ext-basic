module.exports = (brown) ->

  brown.foreach = (obj,tpl,empty) ->
    str = "";
    obj = this[obj]
    tpl = this[tpl]
    empty = this[empty];
    if obj? and obj.length?
      str += brown.render tpl, { 'value': v, 'key':k  } for k,v of obj
    else str = empty
    str

  brown.chain = () ->
    args = Array::slice.call(arguments)
    str = @[args.shift()] 
    str = brown.safe_eval(i,brown)(str) for i in args
    str

  brown.if = ->
    args = Array::slice.call(arguments)
    if @[args[0]] then @[args[1]] else @[args[2]] or args[2]

  brown.template = () -> 
    args = Array::slice.call(arguments)
    id = args.shift()
    str = args.join ':'
    str = str.replace(/\\n/g,"\n")
    @[id] = str.replace(/{/g,'{{').replace(/}/g,'}}')
    return ''

  brown.include = () ->
    args = Array::slice.call(arguments)
    file = args.shift()
    try 
      str = require('fs').readFileSync( __dirname+"/"+file ).toString()
    catch 
      str = ""
    return brown.render str, ( if args.length then brown.safe_eval(args[0],@) else @ )


