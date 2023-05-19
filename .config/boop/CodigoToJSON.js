/**
  {
    "api":1,
    "name":"Codigo to JSON",
    "description":"Converts a Codigo input to JSON",
    "author":"yehyeh",
    "icon":"broom",
    "tags":"codigo,JSON"
  }
**/

function main(input) {
   input.text = input.text.replace(/\'/g, '\"');
   input.text = input.text.replace(/ => /g, ':');
   input.text = "{" + input.text + "}";
   try {
      input.text = JSON.stringify(JSON.parse(input.text), null, 2);
   } catch (error) {
      input.postError("Invalid JSON");
   }
}

