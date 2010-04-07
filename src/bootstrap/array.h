#ifndef _BOOTSTRAP_ARRAY_H_
#define _BOOTSTRAP_ARRAY_H_

void init_array_class();

/**
 * Array class methods
 */
FancyObject_p class_method_Array_new(FancyObject_p self, list<FancyObject_p> args, Scope *scope);

/**
 * Array instance methods
 */
FancyObject_p method_Array_each(FancyObject_p self, list<FancyObject_p> args, Scope *scope);
FancyObject_p method_Array_each_with_index(FancyObject_p self, list<FancyObject_p> args, Scope *scope);
FancyObject_p method_Array_insert(FancyObject_p self, list<FancyObject_p> args, Scope *scope);
FancyObject_p method_Array_clear(FancyObject_p self, list<FancyObject_p> args, Scope *scope);
FancyObject_p method_Array_size(FancyObject_p self, list<FancyObject_p> args, Scope *scope);
FancyObject_p method_Array_at(FancyObject_p self, list<FancyObject_p> args, Scope *scope);
FancyObject_p method_Array_append(FancyObject_p self, list<FancyObject_p> args, Scope *scope);
FancyObject_p method_Array_clone(FancyObject_p self, list<FancyObject_p> args, Scope *scope);

#endif /* _BOOTSTRAP_ARRAY_H_ */
