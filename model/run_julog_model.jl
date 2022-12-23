include("./julog_model.jl")

# Jobs to run
goal_list = [
    (
        name = "primary_key(K)",
        goals = (@julog [primary_key(K)])
    ),
    (
        name = "data_key(K)",
        goals = (@julog [data_key(K)])
    ),
    (
        name = "foreign_key(K)",
        goals = (@julog [foreign_key(K)])
    ),
    (
        name = "column_type(Type(Y), Column(C), Table(T))",
        goals = (@julog [column_type(T, C, Y)])
    ),
    (
        name = "table_write_rank(Type(Y), WriteRank(W), Table(T))",
        goals = (@julog [table_write_rank(Y, T, W)])
    ),
]

# Run each job in `goal_list`
for t in goal_list
    # Print name key
    println("# $(t.name) #")

    # Print notes if provided
    if hasfield(typeof(t), :notes)
        println("$(t.notes)")
    end

    # Call Julog
    sat, subst = resolve(t.goals, clauses)

    # Print results
    println("satisfied: $sat")
    for sub in subst
        println("  $sub")
    end
    println()
end
