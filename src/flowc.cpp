#include "FlowCompiler.h"
#include "FlowLexer.h"
#include "FlowParser.h"

int main(int argc, const char *argv[]) {
  std::ifstream src(argv[1]);
  antlr4::ANTLRInputStream input(src);

  FlowLexer lexer(&input);
  antlr4::CommonTokenStream tokens(&lexer);

  FlowParser parser(&tokens);
  FlowParser::ProgramContext *program = parser.program();

  FlowCompiler compiler(program);
  std::string result = compiler.compile();

  std::ofstream out(argv[2]);
  out << result;

  return 0;
}
