formula = "1-2"

class Stack

  def initialize
   @the_stack = []
  end

  def push(item)
    @the_stack.push item
  end

  def pop
    @the_stack.pop
  end

  def count
    @the_stack.length
  end
end

#N – negacja (Np, 'nieprawda że p')
#C – implikacja (Cpq, 'jeżeli p to q')
#A – alternatywa (Apq, 'p lub q')
#D – dysjunkcja (Dpq, 'p albo q')
#K – koniunkcja (Kpq, 'p i q')
#E – równoważność (Epq, 'p wtedy, i tylko wtedy gdy q')

def impl_free(formula)
  formula.gsub("C", "AN")
end

def nnf(formula)
  case formula
    when /^~+\d+$/ 
      formula
    when /^NN.+$/
      formula[2..formula.length]
    when /^K.+$/
      
  end
end

def cnf(formula)
  case formula
    when /^~+\d+$/ 
      formula
    when /.+&.+/
      #cnf(formula[0..formula.index('&')]) + "+" + cnf(formula[formula.index('&')..formula.length])    
  end
end

#p impl_free("CCppp")
p nnf("NNa")
