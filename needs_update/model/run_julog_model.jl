include("./julog_model.jl")

goal_list = [
    (name = "data_key(K)", goals = (@julog [data_key(K)])),
    (name = "foreign_key(K)", goals = (@julog [foreign_key(K)])),
    (
        name = "col(Column(A), Key(B), Type(C))",
        goals = (@julog [col(A, B, C)]),
        notes = "PK => Primary Key, FK => Foreign Key, PFK => Primary Foreign Key, DA => Data Column",
    ),
]

for t in goal_list
    println("# $(t.name) #")

    if hasfield(typeof(t), :notes)
        println("$(t.notes)")
    end

    sat, subst = resolve(t.goals, clauses)

    println("satisfied: $sat")
    for sub in subst
        println("  $sub")
    end
    println()
end
