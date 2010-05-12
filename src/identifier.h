#ifndef _IDENTIFIER_H_
#define _IDENTIFIER_H_

namespace fancy {

  class Identifier;
  typedef Identifier* Identifier_p;

  /**
   * Identifier class representing identifiers in Fancy.
   * Used e.g. for variables, methodnames etc.
   */
  class Identifier : public Expression
  {
  public:
    /**
     * Identifier constructor. Takes a C++ string that is the actual
     * identifier name.
     * @param name The identifier name.
     */
    Identifier(const string &name);
    ~Identifier();
  
    /**
     * Inherited from Expression.
     */
    virtual FancyObject_p eval(Scope *scope);
    virtual OBJ_TYPE type() const;

    /**
     * Returns the name of the Identifier as a C++ string.
     * @return The name of the Identifier as a C++ string.
     */
    string name() const;

    /**
     * Returns an Identifier with the given name value.
     * @param name The C++ string with the name of the Identifier.
     * @return Identifier with the given name (might have been created
     * before, so the actual object is shared)
     */
    static Identifier_p from_string(const string &name);

  private:
    string _name;

    static map<string, Identifier_p> ident_cache;
  };

}

#endif /* _IDENTIFIER_H_ */
