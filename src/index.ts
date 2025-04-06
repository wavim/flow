// this TS version is only for initial rapid prototyping

import { CharStream, CommonTokenStream } from "antlr4ng";
import { FlowLexer } from "./parser/generated/FlowLexer";
import { FlowParser } from "./parser/generated/FlowParser";

const input = `{}`;
const chars = CharStream.fromString(input);
const lexer = new FlowLexer(chars);
const tokens = new CommonTokenStream(lexer);
const parser = new FlowParser(tokens);
const tree = parser.program();

console.log(format(tree.toStringTree(parser)));

function format(input: string, indent = 0): string {
	let formatted = "";

	for (const char of input) {
		if (char === "(") {
			formatted += `\n${"  ".repeat(indent)}(`;
			indent += 2;
		} else if (char === ")") {
			indent -= 2;
			formatted += `\n${"  ".repeat(indent)})`;
		} else {
			formatted += char;
		}
	}

	return formatted;
}
