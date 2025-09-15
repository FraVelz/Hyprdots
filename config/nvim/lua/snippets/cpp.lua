local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- Atajo: "main"
  s("!ios", {
    t({
      "#include <iostream>",
      "",
      "using namespace std;",
      "",
      "int main() {",
      "\tios_base::sync_with_stdio(false);",
      "\tcin.tie(nullptr);",
      "",
      "\t",
    }),
    i(1, "// tu código aquí"),
    t({
      "",
      "",
      "\treturn 0;",
      "}",
    }),
  }),

  s("!info", {



    t({
      "// Nombre: Francisco Javier Velez Otavo",
      "// Grado: 1001",
      "// UserOmegaup: Fravelz",
      "// Residencia: Colombia, Bogota DC, San Cristobal",
      ""
    }),
    i(1, ""),
  }),


  -- Otro ejemplo: "fori"
  s("fori", {
    t("for (int i = 0; i < "),
    i(1, "n"),
    t("; i++) {"),
    t({"", "\t"}),
    i(2, "// cuerpo del bucle"),
    t({"", "}"}),
  }),
}

