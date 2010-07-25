# *** This file is generated by InstructionParser ***

def class Rubinius {
  def class InstructionSet {
    self opcode:  0 name: :noop                         effects: <[:stack => [0, 0],     :args => [],                               :control_flow => :next]>;

    # Push primitiv values
    self opcode:  1 name: :push_nil                     effects: <[:stack => [0, 1],     :args => [],                               :control_flow => :next]>;
    self opcode:  2 name: :push_true                    effects: <[:stack => [0, 1],     :args => [],                               :control_flow => :next]>;
    self opcode:  3 name: :push_false                   effects: <[:stack => [0, 1],     :args => [],                               :control_flow => :next]>;
    self opcode:  4 name: :push_int                     effects: <[:stack => [0, 1],     :args => [:number],                        :control_flow => :next]>;
    self opcode:  5 name: :push_self                    effects: <[:stack => [0, 1],     :args => [],                               :control_flow => :next]>;

    # Manipulate literals
    self opcode:  6 name: :set_literal                  effects: <[:stack => [0, 0],     :args => [:literal],                       :control_flow => :next]>;
    self opcode:  7 name: :push_literal                 effects: <[:stack => [0, 1],     :args => [:literal],                       :control_flow => :next]>;

    # Flow control
    self opcode:  8 name: :goto                         effects: <[:stack => [0, 0],     :args => [:location],                      :control_flow => :branch]>;
    self opcode:  9 name: :goto_if_false                effects: <[:stack => [1, 0],     :args => [:location],                      :control_flow => :branch]>;
    self opcode: 10 name: :goto_if_true                 effects: <[:stack => [1, 0],     :args => [:location],                      :control_flow => :branch]>;
    self opcode: 11 name: :ret                          effects: <[:stack => [0, 0],     :args => [],                               :control_flow => :return]>;

    # Stack manipul ions
    self opcode: 12 name: :swap_stack                   effects: <[:stack => [0, 0],     :args => [],                               :control_flow => :next]>;
    self opcode: 13 name: :dup_top                      effects: <[:stack => [0, 1],     :args => [],                               :control_flow => :next]>;
    self opcode: 14 name: :dup_many                     effects: <[:stack => [[0,1], [0, 1, 2]],:args => [:count],                  :control_flow => :next]>;
    self opcode: 15 name: :pop                          effects: <[:stack => [1, 0],     :args => [],                               :control_flow => :next]>;
    self opcode: 16 name: :pop_many                     effects: <[:stack => [[0,1], 0], :args => [:count],                         :control_flow => :next]>;
    self opcode: 17 name: :rotate                       effects: <[:stack => [0, 0],     :args => [:count],                         :control_flow => :next]>;
    self opcode: 18 name: :move_down                    effects: <[:stack => [0, 0],     :args => [:positions],                     :control_flow => :next]>;

    # Manipulate local variables
    self opcode: 19 name: :set_local                    effects: <[:stack => [0, 0],     :args => [:local],                         :control_flow => :next]>;
    self opcode: 20 name: :push_local                   effects: <[:stack => [0, 1],     :args => [:local],                         :control_flow => :next]>;
    self opcode: 21 name: :push_local_depth             effects: <[:stack => [0, 1],     :args => [:depth, :index],                 :control_flow => :next]>;
    self opcode: 22 name: :set_local_depth              effects: <[:stack => [0, 0],     :args => [:depth, :index],                 :control_flow => :next]>;
    self opcode: 23 name: :passed_arg                   effects: <[:stack => [0, 1],     :args => [:index],                         :control_flow => :next]>;

    # Manipulate ex options
    self opcode: 24 name: :push_current_exception       effects: <[:stack => [0, 1],     :args => [],                               :control_flow => :next]>;
    self opcode: 25 name: :clear_exception              effects: <[:stack => [0, 0],     :args => [],                               :control_flow => :next]>;
    self opcode: 26 name: :push_exception_state         effects: <[:stack => [0, 1],     :args => [],                               :control_flow => :next]>;
    self opcode: 27 name: :restore_exception_state      effects: <[:stack => [1, 0],     :args => [],                               :control_flow => :next]>;
    self opcode: 28 name: :raise_exc                    effects: <[:stack => [0, 0],     :args => [],                               :control_flow => :raise]>;
    self opcode: 29 name: :setup_unwind                 effects: <[:stack => [0, 0],     :args => [:ip, :type],                     :control_flow => :handler]>;
    self opcode: 30 name: :pop_unwind                   effects: <[:stack => [0, 0],     :args => [],                               :control_flow => :next]>;
    self opcode: 31 name: :raise_return                 effects: <[:stack => [0, 0],     :args => [],                               :control_flow => :raise]>;
    self opcode: 32 name: :ensure_return                effects: <[:stack => [0, 0],     :args => [],                               :control_flow => :raise]>;
    self opcode: 33 name: :raise_break                  effects: <[:stack => [0, 0],     :args => [],                               :control_flow => :raise]>;
    self opcode: 34 name: :reraise                      effects: <[:stack => [0, 0],     :args => [],                               :control_flow => :raise]>;

    # Manipulate arrays
    self opcode: 35 name: :make_array                   effects: <[:stack => [[0,1], 1], :args => [:count],                         :control_flow => :next]>;
    self opcode: 36 name: :cast_array                   effects: <[:stack => [1, 1],     :args => [],                               :control_flow => :next]>;
    self opcode: 37 name: :shift_array                  effects: <[:stack => [1, 2],     :args => [],                               :control_flow => :next]>;

    # Manipulate instance variables
    self opcode: 38 name: :set_ivar                     effects: <[:stack => [0, 0],     :args => [:index],                         :control_flow => :next]>;
    self opcode: 39 name: :push_ivar                    effects: <[:stack => [0, 1],     :args => [:index],                         :control_flow => :next]>;

    # Manipulate constants
    self opcode: 40 name: :push_const                   effects: <[:stack => [0, 1],     :args => [:literal],                       :control_flow => :next]>;
    self opcode: 41 name: :set_const                    effects: <[:stack => [0, 0],     :args => [:index],                         :control_flow => :next]>;
    self opcode: 42 name: :set_const_at                 effects: <[:stack => [2, 0],     :args => [:index],                         :control_flow => :next]>;
    self opcode: 43 name: :find_const                   effects: <[:stack => [1, 1],     :args => [:index],                         :control_flow => :next]>;
    self opcode: 44 name: :push_cpath_top               effects: <[:stack => [0, 1],     :args => [],                               :control_flow => :next]>;
    self opcode: 45 name: :push_const_fast              effects: <[:stack => [0, 1],     :args => [:literal, :association],         :control_flow => :next]>;

    # Send messages
    self opcode: 46 name: :set_call_flags               effects: <[:stack => [0, 0],     :args => [:flags],                         :control_flow => :next]>;
    self opcode: 47 name: :allow_private                effects: <[:stack => [0, 0],     :args => [],                               :control_flow => :next]>;
    self opcode: 48 name: :send_method                  effects: <[:stack => [1, 1],     :args => [:literal],                       :control_flow => :send]>;
    self opcode: 49 name: :send_stack                   effects: <[:stack => [[1,2], 1], :args => [:literal, :count],               :control_flow => :send]>;
    self opcode: 50 name: :send_stack_with_block        effects: <[:stack => [[2,2], 1], :args => [:literal, :count],               :control_flow => :send]>;

    CALL_FLAG_CONCA = 2;

    self opcode: 51 name: :send_stack_with_splat        effects: <[:stack => [[3,2], 1], :args => [:literal, :count],               :control_flow => :send]>;
    self opcode: 52 name: :send_super_stack_with_block  effects: <[:stack => [[1,2], 1], :args => [:literal, :count],               :control_flow => :send]>;
    self opcode: 53 name: :send_super_stack_with_splat  effects: <[:stack => [[2,2], 1], :args => [:literal, :count],               :control_flow => :send]>;

    # Manipulate blocks
    self opcode: 54 name: :push_block                   effects: <[:stack => [0, 1],     :args => [],                               :control_flow => :next]>;
    self opcode: 55 name: :passed_blockarg              effects: <[:stack => [0, 1],     :args => [:count],                         :control_flow => :next]>;
    self opcode: 56 name: :create_block                 effects: <[:stack => [0, 1],     :args => [:literal],                       :control_flow => :next]>;
    self opcode: 57 name: :cast_for_single_block_arg    effects: <[:stack => [0, 1],     :args => [],                               :control_flow => :next]>;
    self opcode: 58 name: :cast_for_multi_block_arg     effects: <[:stack => [0, 1],     :args => [],                               :control_flow => :next]>;
    self opcode: 59 name: :cast_for_splat_block_arg     effects: <[:stack => [0, 1],     :args => [],                               :control_flow => :next]>;
    self opcode: 60 name: :yield_stack                  effects: <[:stack => [[0,1], 1], :args => [:count],                         :control_flow => :yield]>;
    self opcode: 61 name: :yield_splat                  effects: <[:stack => [[1,1], 1], :args => [:count],                         :control_flow => :yield]>;

    # Manipulate strings
    self opcode: 62 name: :string_append                effects: <[:stack => [2, 1],     :args => [],                               :control_flow => :next]>;
    self opcode: 63 name: :string_build                 effects: <[:stack => [[0,1], 1], :args => [:count],                         :control_flow => :next]>;
    self opcode: 64 name: :string_dup                   effects: <[:stack => [1, 1],     :args => [],                               :control_flow => :next]>;

    # Manipulate scopes
    self opcode: 65 name: :push_scope                   effects: <[:stack => [0, 1],     :args => [],                               :control_flow => :next]>;
    self opcode: 66 name: :add_scope                    effects: <[:stack => [1, 0],     :args => [],                               :control_flow => :next]>;
    self opcode: 67 name: :push_variables               effects: <[:stack => [0, 1],     :args => [],                               :control_flow => :next]>;

    # Miscellaneous TODO: better categorize these
    self opcode: 68 name: :check_interrupts             effects: <[:stack => [0, 0],     :args => [],                               :control_flow => :next]>;
    self opcode: 69 name: :yield_debugger               effects: <[:stack => [0, 0],     :args => [],                               :control_flow => :next]>;
    self opcode: 70 name: :is_nil                       effects: <[:stack => [1, 1],     :args => [],                               :control_flow => :next]>;
    self opcode: 71 name: :check_serial                 effects: <[:stack => [1, 1],     :args => [:literal, :serial],              :control_flow => :next]>;
    self opcode: 72 name: :check_serial_private         effects: <[:stack => [1, 1],     :args => [:literal, :serial],              :control_flow => :next]>;

    # Access object fields
    self opcode: 73 name: :push_my_field                effects: <[:stack => [0, 1],     :args => [:index],                         :control_flow => :next]>;
    self opcode: 74 name: :store_my_field               effects: <[:stack => [0, 0],     :args => [:index],                         :control_flow => :next]>;

    # Type checks
    self opcode: 75 name: :kind_of                      effects: <[:stack => [2, 1],     :args => [],                               :control_flow => :next]>;
    self opcode: 76 name: :instance_of                  effects: <[:stack => [2, 1],     :args => [],                               :control_flow => :next]>;

    # Optimization instructions
    self opcode: 77 name: :meta_push_neg_1              effects: <[:stack => [0, 1],     :args => [],                               :control_flow => :next]>;
    self opcode: 78 name: :meta_push_0                  effects: <[:stack => [0, 1],     :args => [],                               :control_flow => :next]>;
    self opcode: 79 name: :meta_push_1                  effects: <[:stack => [0, 1],     :args => [],                               :control_flow => :next]>;
    self opcode: 80 name: :meta_push_2                  effects: <[:stack => [0, 1],     :args => [],                               :control_flow => :next]>;
    self opcode: 81 name: :meta_send_op_plus            effects: <[:stack => [2, 1],     :args => [:literal],                       :control_flow => :send]>;
    self opcode: 82 name: :meta_send_op_minus           effects: <[:stack => [2, 1],     :args => [:literal],                       :control_flow => :send]>;
    self opcode: 83 name: :meta_send_op_equal           effects: <[:stack => [2, 1],     :args => [:literal],                       :control_flow => :send]>;
    self opcode: 84 name: :meta_send_op_lt              effects: <[:stack => [2, 1],     :args => [:literal],                       :control_flow => :next]>;
    self opcode: 85 name: :meta_send_op_gt              effects: <[:stack => [2, 1],     :args => [:literal],                       :control_flow => :next]>;
    self opcode: 86 name: :meta_send_op_tequal          effects: <[:stack => [2, 1],     :args => [:literal],                       :control_flow => :send]>;
    self opcode: 87 name: :meta_send_call               effects: <[:stack => [[1,2], 1], :args => [:literal, :count],               :control_flow => :send]>;

    # More miscellaneous
    self opcode: 88 name: :push_my_offset               effects: <[:stack => [0, 1],     :args => [:index],                         :control_flow => :next]>;
    self opcode: 89 name: :zsuper                       effects: <[:stack => [1, 1],     :args => [:literal],                       :control_flow => :next]>;
    self opcode: 90 name: :push_block_arg               effects: <[:stack => [0, 1],     :args => [],                               :control_flow => :next]>;
    self opcode: 91 name: :push_undef                   effects: <[:stack => [0, 1],     :args => [],                               :control_flow => :next]>;
    self opcode: 92 name: :push_stack_local             effects: <[:stack => [0, 1],     :args => [:which],                         :control_flow => :next]>;
    self opcode: 93 name: :set_stack_local              effects: <[:stack => [1, 1],     :args => [:which],                         :control_flow => :next]>;
    self opcode: 94 name: :push_has_block               effects: <[:stack => [0, 1],     :args => [],                               :control_flow => :next]>;
    self opcode: 95 name: :push_proc                    effects: <[:stack => [0, 1],     :args => [],                               :control_flow => :next]>;
    self opcode: 96 name: :check_frozen                 effects: <[:stack => [1, 1],     :args => [],                               :control_flow => :next]>;
    self opcode: 97 name: :cast_multi_value             effects: <[:stack => [1, 1],     :args => [],                               :control_flow => :next]>;
    self opcode: 98 name: :invoke_primitive             effects: <[:stack => [[0,2], 1], :args => [:literal, :args],                :control_flow => :next]>;
    self opcode: 99 name: :push_rubinius                effects: <[:stack => [0, 1],     :args => [],                               :control_flow => :next]>;
  }
}
