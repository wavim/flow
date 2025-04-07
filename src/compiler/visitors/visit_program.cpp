#include "FlowCompiler.h"

std::any FlowCompiler::visitProgram(FlowParser::ProgramContext *context) {
  if (context == nullptr) {
    return llvm::ConstantInt::get(llvm_context, llvm::APInt(64, 0));
  }
  // TODO
}
