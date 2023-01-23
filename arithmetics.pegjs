Expression "Expression" =
  head:Term tail:(_ ("*" / "/") _ Term)* {
    return tail.reduce(function(result, element) {
        if (element[1] === "*") { return result * element[3]; }
        if (element[1] === "/") { return result / element[3]; }
    },head)
  }
  
Term "Term" =
  head:Factor tail:(_ ("+" / "-") _ Factor)* {
     return tail.reduce(function(result, element) {
        if (element[1] === "+") { return result + element[3]; }
        if (element[1] === "-") { return result - element[3]; }
    },head)   
  }

Factor "Factor" = 
  _ "(" _ expr: Expression _ ")" { return expr }
  / Integer

Integer "Integer" = 
  _ [0-9]+ { return parseInt(text(), 10)}

_ "whitespace" =
  [ \r\n\t]*