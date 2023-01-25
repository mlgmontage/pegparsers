Expression "Expression" =
  "(" op:Operation _ head:Term tail:(_ Term _)* _ ")" {
    return tail.reduce(function (result, element) {
      if (op === '+') { return result + element[1]; }
      if (op === '-') { return result - element[1]; }
    }, head)
  }
  
Operation "Operation" =
  op:("+" / "-") { return op; }
  
Term "Term" =
  _  expr:Expression _ { return expr; }
  / Integer

Integer "Integer" =
  [0-9]+ { return parseInt(text(), 10); }

_ "whitespace" =
  [ \r\t\n]*