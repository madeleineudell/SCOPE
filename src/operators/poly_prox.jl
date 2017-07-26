#############################################################################
# poly_prox.jl
# Produces the proximal operator of indicator functions of the submodular
# polyhedron of a submodular function f: 2ⱽ → ℝ
# For reference look at [Bach 2011]
#############################################################################

# TODO: integrate these functions to function prox, after figuring out how to
# format the indicator function.

# TODO: throw errors when the input fuction is not a set function or is not 0
# on the empty set

# The prox of the indicator function of the submodular polyhedron
function subpolyprox(f <: Function, z::Array{Number})
  # step 1 Initilization
  candidate = Array{Real}
  constituents = Array{Real}(2)
  ini_order = Set{Int}()    #might cause trouble, depending the def of f
  for i = 1 to length(z)
    push!(candidate, f(unionset(ini_order, Set([i]))) - f(ini_order))
    push!(ini_order, i)
  end
  constituents[:, 1] = candidate

  # step 2 Projection onto affine hull

end
