module EmacsTools
using REPL

export get_completions, get_latex_symbols

# print completions of SUBSTRING
function get_completions(substring::AbstractString)
    c = REPL.REPLCompletions.completions(substring, length(substring));
    for completion in c[1]
        if isa(completion, REPL.REPLCompletions.ModuleCompletion)
            println(completion.mod);
        end
    end
end

# print all available LaTeX symbols
function get_latex_symbols()
    c = REPL.REPLCompletions.latex_symbols;
    for (latex, unicode) in sort!(collect(c), by=x->x[2])
        println("$latex $unicode")
    end
end
end # module
