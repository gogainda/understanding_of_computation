Dir[File.join(File.dirname(__FILE__), 'simple_ast', '*.rb')].each {|file| require file }

#expression
statement = Assign.new(:x, Add.new(Variable.new(:x), Number.new(1)))