#############################################################################
# poly_prox.jl
# Produces the proximal operator of indicator functions of the submodular
# polyhedron of a submodular function f: 2ⱽ → ℝ, where V is the base set.
# For reference look at [Bach 2011]
#############################################################################

# TODO: integrate these functions to function prox, after figuring out how to
# format the indicator function.

# TODO: throw errors when the input fuction is not a set function or is not 0
# on the empty set

# The prox of the indicator function of the submodular polyhedron
function subpolyprox(f <: Function, z::Array{Number, 2})

  # step 1 Initilization, pick an arbitrary extreme point
  x = Array{Real, 2}(size(z))
  constituents = Array{Real, 2}
  aff_coeff = [1]
  ini_order = Set()    #might cause trouble, depending the def of f
  for i = 1 to length(z)
    push!(x, f(unionset(ini_order, Set([i]))) - f(ini_order))
    push!(ini_order, i)
  end
  constituents = copy(x)

  # step 2 Projection onto the affine hull
  # Construction of the affine hull

end
