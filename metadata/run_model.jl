include("./julog_model.jl")

println("# data_key(K) #")
goals = @julog [data_key(DK)];
sat,subst = resolve(goals, clauses);
println("sat: $sat")
println("subst: $subst")
println()

println("# foreign_key(K) #")
goals = @julog [foreign_key(FK)];
sat,subst = resolve(goals, clauses);
println("sat: $sat")
println("subst: $subst")
println()
