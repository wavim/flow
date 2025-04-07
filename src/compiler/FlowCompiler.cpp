#include "FlowCompiler.h"

FlowCompiler::FlowCompiler(FlowParser::ProgramContext *input) : program(input) {
  llvm_module = std::make_unique<llvm::Module>("main", llvm_context);
}

llvm::Value FlowCompiler::compile() {
  return std::any_cast<llvm::Value>(visitProgram(program));
}
