brown = require './../node_modules/brown'

require('./../.')(brown)

brown.uppercase = (str) -> str.toUpperCase()
brown.important = (str) -> '!! '+str 

data = 
  itemtemplate: "<div>{{key}} {{value}}</div>"
  items: [1,2,3]

console.log brown.render "{{foreach:items:itemtemplate:No items found}}", data 


console.log brown.render "{{chain:foo:uppercase:important}}", {foo:"hello world"}

console.log brown.render "{{if:foo:bar:sorry}}", {foo:"hello world", bar:"yes!"}

str = '{{template:foobar:
    <b>this is {value}</b>\\n
}}{{foreach:items:foobar:no items found}}
'

console.log brown.render str, { items:[1,2,3] }
