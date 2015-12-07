Basic template functions for brown template engine 

<img alt='' src='https://travis-ci.org/username/reponame.svg'/>

## Usage

    npm install brown
    npm install brown-ext-basic

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


## Example: foo

