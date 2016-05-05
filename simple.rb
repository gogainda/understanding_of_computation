Dir[File.join(File.dirname(__FILE__), 'small_step_semantics', '*.rb')].each {|file| require file }

#expression
statement = Assign.new(:x, Add.new(Variable.new(:x), Number.new(1)))