import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

import "./models/index.tsp";
import "./operations/index.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

@service({ title: "ESIS Unofficial documentation"})
@server("https://svc5.esis.edu.mn", "ESIS server 5 (Default)")


namespace ESIS;