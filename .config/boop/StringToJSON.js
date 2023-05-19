/**
  {
    "api":1,
    "name":"String to JSON",
    "description":"Converts a minified and escaped string to JSON",
    "author":"yehyeh",
    "icon":"broom",
    "tags":"string,JSON"
  }
**/

function main(input) {
   input.text = input.text.replace(/\\"/g, '\"');
   try {
      input.text = JSON.stringify(JSON.parse(input.text), null, 2);
   } catch (error) {
      input.postError("Invalid JSON");
   }
}

