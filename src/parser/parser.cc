#include "includes.h"

/* prototype of bison-generated parser function */
extern int yyparse();
extern void yyrestart(FILE*);
extern yy_buffer_state* yy_create_buffer(FILE*, int);
extern int yy_switch_to_buffer(yy_buffer_state*);
extern int yy_delete_buffer(yy_buffer_state*);

namespace fancy {
  namespace parser {
    
    string current_file;
    stack<parser_buffer> parse_buffers;
    list<string> load_path;

    void parse_file(string &filename)
    {
      // put the path of the file into the load_path vector
      // this makes requiring files in the same directory easier
      string filepath = dirname_for_path(filename);
      if(!is_whitespace(filepath)) {
        load_path.push_back(filepath);
        load_path.unique(); // remove double entries
      }

      if(push_buffer(filename)) {
        yyparse();
        pop_buffer();
      }
    }

    bool push_buffer(const string &filename)
    {
      parser_buffer buf;
      FILE *f = find_open_file(filename);
      if(!f) {
        error("");
        perror(filename.c_str());
        return false;
      }  
      buf.buffstate = yy_create_buffer(f, YY_BUF_SIZE);
      buf.file = f;
      buf.filename = filename;
      buf.lineno = yylineno;
      parse_buffers.push(buf);
      
      current_file = filename;
      yylineno = 1;
      
      yy_switch_to_buffer(buf.buffstate);
      return true;
    }

    void pop_buffer()
    {
      if(!parse_buffers.empty()) {
        parser_buffer buf = parse_buffers.top();
        parse_buffers.pop();
        
        fclose(buf.file);
        yy_delete_buffer(buf.buffstate);

        if(!parse_buffers.empty()) {        
          parser_buffer prev = parse_buffers.top();
          yy_switch_to_buffer(prev.buffstate);
          yylineno = prev.lineno;
          current_file = prev.filename;
        }
      }
    }

    FILE* find_open_file(const string &filename)
    {
      FILE *f = 0;

      // try direct filename first
      f = fopen(filename.c_str(), "r");

      // if that failed, try with each path in load_path prependet to
      // the filename until we succeed
      if(!f) {
        for(list<string>::iterator it = load_path.begin();
            it != load_path.end();
            it++) {
          f = fopen(((*it) + "/" + filename).c_str(), "r");
          if(f) {
            return f;
          }
        }
      }
      // at this point we failed and f = 0
      return f;
    }

    string dirname_for_path(const string &path)
    {
      size_t found = path.find_last_of("/\\");
      return path.substr(0,found);
    }
    string filename_for_path(const string &path)
    {
      size_t found = path.find_last_of("/\\");
      return path.substr(found + 1);
    }

    bool is_whitespace(const string &str)
    {
      size_t found = str.find_first_not_of(" \t\r\n");
      return str.substr(found) == "";
    }

  }
}
