def split(formula)
  ilosc = 1
  counter = 0
  formula[1..-1].each_char do |c|
    counter += 1
    case c
      when /^\d$/ 
        ilosc -= 1
      when /^[AK]$/ 
        ilosc += 1
    end
    return formula[1..counter], formula[counter+1..-1] if ilosc == 0
  end 
end

def impl_free(formula)
  formula.gsub("C", "AN")
end

def nnf(formula)
  case formula
    when /^N?\d$/ 
      formula
    when /^NN.+$/
      formula[2..formula.length]
    when /^K.+$/
      form1, form2 = split(formula)
      "K" + nnf(form1) + nnf(form2)
    when /^A.+$/
      form1, form2 = split(formula)
      "A" + nnf(form1) + nnf(form2)
    when /^NK.+$/
      form1, form2 = split(formula[1..formula.length])
      "K" + nnf("N" + form1) + nnf("N" + form2)
    when /^NA.+$/
      form1, form2 = split(formula[1..formula.length])
      "A" + nnf("N" + form1) + nnf("N" + form2)
  end
end

def distr(formula1, formula2)
  if formula1 =~ /^K.+$/
    form1, form2 = split(formula1)
    "K" + distr(form1, formula2) + distr(form2, formula2)
  elsif formula2 =~ /^K.+$/
    form1, form2 = split(formula2)
    "K" + distr(form1, formula1) + distr(form2, formula1)
  else
    "A" + formula1 + formula2
  end
end

def cnf(formula)
  case formula
    when /^N?\d$/ 
      formula
    when /^K.+$/
      form1, form2 = split(formula)
      "K" + cnf(form1) + cnf(form2)   
    when /^A.+$/
      form1, form2 = split(formula)
      distr(cnf(form1), cnf(form2))
  end
end

def changeNotation(formula)
  case formula
    when /^N?\d$/ 
      formula
    when /^NN.+$/
      formula[2..formula.length]
    when /^K.+$/
      form1, form2 = split(formula)
      changeNotation(form1) + "K" + changeNotation(form2)
    when /^A.+$/
      form1, form2 = split(formula)
      changeNotation(form1) + "A" + changeNotation(form2)
    when /^NK.+$/
      form1, form2 = split(formula[1..formula.length])
      changeNotation("N" + form1) + "K" +  changeNotation("N" + form2)
    when /^NA.+$/
      form1, form2 = split(formula[1..formula.length])
      changeNotation("N" + form1) + "A" + changeNotation("N" + form2)
  end
end

wynik = cnf(nnf(impl_free("KNA1N1NKC11NN2")))
iloscZmiennych = wynik.split("").uniq.delete_if { |c| c =~ /[KAN]/ }.size
iloscKoniunkcji = wynik.split("").delete_if { |c| c =~ /[AN\d]/ }.size + 1

doPliku = "p cnf #{iloscZmiennych} #{iloscKoniunkcji}\n"
doPliku += changeNotation(wynik).gsub("N", "-").gsub("A", " ").gsub("K", " 0 ") + " 0"

f = File.new("wyniczek.txt", "w") 
f.write(doPliku)
f.close
