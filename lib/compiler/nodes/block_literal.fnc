def class AST {
  def class BlockLiteral : Node {
    self read_write_slots: ['args, 'body];
    def BlockLiteral args: args body: body {
      bl = AST::BlockLiteral new;
      bl args: args;
      bl body: body;
      bl
    }

    def BlockLiteral from_sexp: sexp {
      args = sexp second map: 'to_ast;
      body = sexp third to_ast;
      AST::BlockLiteral args: args body: body
    }

    def to_ruby: out indent: ilvl {
      out print: "Proc.new{";
      @args empty? if_false: {
        out print: "|";
        @args each: |a| { a to_ruby: out } in_between: { out pint: ", "};
        out print: "|"
      };
      out print: " ";
      @body to_ruby: out indent: ilvl;
      out print: " }"
    }
  }
}
