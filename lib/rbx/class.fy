class Class {
  ruby_alias: 'superclass
  ruby_alias: '===
  ruby_alias: 'ancestors
  ruby_alias: 'instance_methods
  ruby_alias: 'methods

  def new {
    """
    @return A new @Class@ subclassed from @Object@.

    Creates a new @Class@ instance by subclassing @Object@.
    """

    obj = allocate()
    obj initialize
    obj
  }

  # calls initialize:, if defined
  def new: superclass {
    """
    @superclass The superclass to inherit from.
    @return A new @Class@ inherited from @superclass.

    Creates a new @Class@ instance by subclassing @superclass.
    """

    obj = allocate()
    obj initialize: superclass
    obj
  }

  def Class superclass: superclass body: body_block {
    """
    @superclass The superclass to inherit from.
    @body_block A @Block@ that is used as the body of the new @Class@.
    @return A new @Class@ inherited from @superclass.

    Creates a new @Class@ by subclassing @superclass and using
    @body_block as its body.
    """

    new(superclass, &body_block)
  }

  def initialize {
    """
    Initializes a @Class@ with @Object@ set as superclass (default superclass).
    """
    initialize: Object
  }

  def initialize: superclass {
    """
    Initializes a @Class@ with a superclass.
    """
    initialize(superclass)
  }

  def define_method: name with: block {
    """
    @name Name of the method to be defined.
    @block A @Block@ that is used as the method's body.

    Defines an instance method on a @Class@ with a given name and
    body.
    """

    define_method(message_name: name, &block)
  }

  def undefine_method: name {
    """
    @name Name of the method to undefine (remove) from a @Class@.

    Undefines an instance method on a Class with a given name.
    """

    remove_method(message_name: name)
  }

  def define_class_method: name with: block {
    """
    @name Name of the class method to be defined.
    @block A @Block@ to be used as the class methods body.

    Defines a class method on a @Class@ (a singleton method) with a
    given name and body.
    """

    define_singleton_method: name with: block
  }

  def undefine_class_method: name {
    """
    @name Name of the class method to undefine (remove).

    Undefines a class method on a @Class@ with a given name.
    """

    undefine_singleton_method: name
  }

  def subclass: body_block {
    """
    @body_block A @Block@ that gets used as the body of the @Class@.
    @return A new @Class@ inherited from @self.

    Creates a new @Class@ with @self as superclass and the given body.
    """

    Class superclass: self body: body_block
  }

  def nested_classes {
    """
    @return @Array@ of all nested classes for @self.

    Returns all the nested classes within a @Class@ as an @Array@.
    """

    "Not Yet Implemented" raise!
  }

  def instance_method: name {
    """
    @name Name of the instance method to return.
    @return The instance @Method@ with the given @name or @nil.

    Returns an instance method for a @Class@ with a given name.
    """

    instance_method(message_name: name)
  }

  def alias_method_rbx: new_method_name for: old_method_name {
    """
    Rbx specific version of alias_method:for: due to bootstrap order
    reasons. Should not be used directly.
    """

    alias_method(message_name: new_method_name, message_name: old_method_name)
  }

  def alias_method: new_method_name for_ruby: ruby_method_name {
    """
    Creates a method alias for a Ruby method.
    """
    alias_method(message_name: new_method_name, ruby_method_name)
  }
}
