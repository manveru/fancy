class TrueClass
  define_method("if_true:else:") do |then_block, else_block|
    then_block.call
  end

  def not
      nil
  end
end