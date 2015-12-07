Basic template functions for brown template engine 

<img alt='' src='https://travis-ci.org/coderofsalvation/brown-ext-basic/reponame.svg'/>

## Usage

    npm install brown
    npm install brown-ext-basic

then 

    brown = require('brown')
    require('brown-ext-basic')(brown)

    brown.render(.....)

## Looping / iteration


    data = 
      itemtemplate: "<div>{{key}} {{value}}</div>"
      items: [1,2,3]

    brown.render "{{foreach:items:itemtemplate:No items found}}", data 

output:

    <div>0 1</div><div>1 2</div><div>2 3</div>


## Function Chaining

    brown.uppercase = (str) -> str.toUpperCase()
    brown.important = (str) -> '!! '+str 
    brown.render "{{chain:foo:uppercase:important}}", {foo:"hello world"}

output:

    !! HELLO WORLD


## If / Else 

    brown.render "{{if:foo:bar:sorry}}", {foo:"hello world", bar:"yes!"}

output:

    yes!

## Inline templates 

    str = ' 
      {{template:foobar:
          <b>this is {value}</b>\\n
      }}

      {{foreach:items:foobar:no items found}}
    ';

    brown.render str, { items:[1,2,3] }

output:

    <b>this is 1</b>
    <b>this is 2</b>
    <b>this is 3</b>

## Include 

test/include.brown :

    included was {{foo}} !!

coffeescript:

    console.log brown.render '{{include:test/include.brown}}', { foo:"was succesful" }
    console.log brown.render '{{include:test/include.brown:newdata}}', { newdata:{ foo:"was succesful"} }

output:    
    
    included was succesful !!
    included was succesful !!


