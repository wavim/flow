#pragma once

#include "FlowParser.h"
#include "FlowParserVisitor.h"

#include "llvm/ADT/APInt.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Value.h"

class FlowCompiler final : FlowParserVisitor {
public:
  llvm::LLVMContext llvm_context;
  std::unique_ptr<llvm::Module> llvm_module;

  FlowParser::ProgramContext *program;
  explicit FlowCompiler(FlowParser::ProgramContext *input);

  llvm::Value compile();

  std::any visitProgram(FlowParser::ProgramContext *context) override;

  std::any
  visitStatementList(FlowParser::StatementListContext *context) override;

  std::any visitBlock(FlowParser::BlockContext *context) override;

  std::any visitStatement(FlowParser::StatementContext *context) override;

  std::any visitNullLiteral(FlowParser::NullLiteralContext *context) override;

  std::any
  visitBooleanLiteral(FlowParser::BooleanLiteralContext *context) override;

  std::any
  visitStringLiteral(FlowParser::StringLiteralContext *context) override;

  std::any
  visitNumericLiteral(FlowParser::NumericLiteralContext *context) override;

  std::any
  visitBinIntLiteral(FlowParser::BinIntLiteralContext *context) override;

  std::any
  visitOctIntLiteral(FlowParser::OctIntLiteralContext *context) override;

  std::any
  visitDecIntLiteral(FlowParser::DecIntLiteralContext *context) override;

  std::any
  visitHexIntLiteral(FlowParser::HexIntLiteralContext *context) override;

  std::any visitFloatLiteral(FlowParser::FloatLiteralContext *context) override;

  std::any visitParenthesizedExpression(
      FlowParser::ParenthesizedExpressionContext *context) override;

  std::any visitAdditiveExpression(
      FlowParser::AdditiveExpressionContext *context) override;

  std::any visitTernaryExpression(
      FlowParser::TernaryExpressionContext *context) override;

  std::any
  visitAssignExpression(FlowParser::AssignExpressionContext *context) override;

  std::any
  visitPowerExpression(FlowParser::PowerExpressionContext *context) override;

  std::any visitLiteralExpression(
      FlowParser::LiteralExpressionContext *context) override;

  std::any
  visitBitXorExpression(FlowParser::BitXorExpressionContext *context) override;

  std::any
  visitUnaryExpression(FlowParser::UnaryExpressionContext *context) override;

  std::any visitIdentifierExpression(
      FlowParser::IdentifierExpressionContext *context) override;

  std::any visitComparisonExpression(
      FlowParser::ComparisonExpressionContext *context) override;

  std::any
  visitBitAndExpression(FlowParser::BitAndExpressionContext *context) override;

  std::any visitLogicAndExpression(
      FlowParser::LogicAndExpressionContext *context) override;

  std::any visitLogicOrExpression(
      FlowParser::LogicOrExpressionContext *context) override;

  std::any visitExpressionSequenceExpression(
      FlowParser::ExpressionSequenceExpressionContext *context) override;

  std::any
  visitBitOrExpression(FlowParser::BitOrExpressionContext *context) override;

  std::any visitEqualityExpression(
      FlowParser::EqualityExpressionContext *context) override;

  std::any visitMultiplicativeExpression(
      FlowParser::MultiplicativeExpressionContext *context) override;

  std::any visitBitShiftExpression(
      FlowParser::BitShiftExpressionContext *context) override;
};
