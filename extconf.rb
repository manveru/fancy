base = File.dirname(__FILE__)
puts "Fancy hasn't been bootstrapped yet. Doing that now.\n\n"
File.open("Makefile", "w") do |f|
  f.puts "install:"
  f.puts "				rbx -S rake clean && rbx -S rake"
end
exit 0