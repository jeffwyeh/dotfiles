/**
  {
    "api":1,
    "name":"JSON to String",
    "description":"Minifies and escapes JSON to a single string",
    "author":"yehyeh",
    "icon":"quote",
    "tags":"JSON,string"
  }
**/

function main(input) {
   input.text = input.text.replace(/\"/g, '\\"');
   try {
      input.text = JSON.stringify(JSON.parse(input.text));
   } catch (error) {
      input.postError("Invalid JSON");
   }
}

