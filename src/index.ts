//MO DEV this TS version is only for initial rapid prototyping

import { CharStream, CommonTokenStream } from "antlr4ng";
import { FlowLexer } from "./pre_transform/FlowLexer";
import { FlowParser } from "./pre_transform/FlowParser";

const input = ``;
const chars = CharStream.fromString(input);
const lexer = new FlowLexer(chars);
const tokens = new CommonTokenStream(lexer);
const parser = new FlowParser(tokens);
const tree = parser.program();

//MO TODO check ast walkers in antlr
