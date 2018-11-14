module EmacsTools

export get_completions, get_latex_symbols

# print completions of SUBSTRING
function get_completions(substring::AbstractString)
  c = Base.REPLCompletions.completions(substring, length(substring));
  for completion in c[1]
    println(completion);
  end
end

# print all available LaTeX symbols
function get_latex_symbols()
  c = Base.REPLCompletions.latex_symbols;
  for (latex, unicode) in sort!(collect(c), by=x->x[2])
    println("$latex $unicode")
  end
end

end # module
