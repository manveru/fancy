#include "includes.h"

/**
 * Core Classes
 */
Class_p ClassClass = 0;
Class_p ModuleClass;
Class_p ObjectClass;
Class_p NilClass;
Class_p TClass;
Class_p StringClass;
Class_p SymbolClass;
Class_p NumberClass;
Class_p RegexClass;
Class_p ArrayClass;
Class_p HashClass;
Class_p MethodClass;
Class_p MethodCallClass;
Class_p BlockClass;

Class_p ConsoleClass;

/**
 * Global Singleton Objects
 */
FancyObject_p nil;
FancyObject_p t;


/**
 * Runtime initialization functions.
 */
void init_core_classes()
{
  ObjectClass = new Class();

  ClassClass = new Class(ObjectClass);
  ClassClass->set_class(ClassClass);
  ObjectClass->set_class(ClassClass);

  ModuleClass = new Class(ObjectClass);
  ModuleClass->set_class(ModuleClass);

  NilClass = new Class(ObjectClass);
  TClass = new Class(ObjectClass);
  StringClass = new Class(ObjectClass);
  SymbolClass = new Class(ObjectClass);
  NumberClass = new Class(ObjectClass);
  RegexClass = new Class(ObjectClass);
  ArrayClass = new Class(ObjectClass);
  HashClass = new Class(ObjectClass);
  MethodClass = new Class(ObjectClass);
  MethodCallClass = new Class(ObjectClass);
  BlockClass = new Class(ObjectClass);

  ConsoleClass = new Class(ObjectClass);

  init_object_class();
  init_block_class();
  init_string_class();
  init_number_class();
  init_console_class();
}

void init_global_objects()
{
  nil = new FancyObject(NilClass, new Nil());
  t = new FancyObject(TClass, new T());
}

void init_global_scope()
{
  // the global scope has ObjectClass as its current_self value
  // -> every global method call is a methodcall on ObjectClass
  global_scope = new Scope(ObjectClass);

  /* define classes */
  global_scope->define("Class", ClassClass);
  global_scope->define("Module", ModuleClass);
  global_scope->define("Object", ObjectClass);
  global_scope->define("NilClass", NilClass);
  global_scope->define("TrueClass", TClass);
  global_scope->define("String", StringClass);
  global_scope->define("Symbol", SymbolClass);
  global_scope->define("Number", NumberClass);
  global_scope->define("Regex", RegexClass);
  global_scope->define("Array", ArrayClass);
  global_scope->define("Hash", HashClass);
  global_scope->define("Method", MethodClass);
  global_scope->define("MethodCall", MethodClass);
  global_scope->define("Block", BlockClass);

  global_scope->define("Console", ConsoleClass);
  
  /* define singleton objects */
  global_scope->define("nil", nil);
  global_scope->define("true", t);
}