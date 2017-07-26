#############################################################################
# prox.jl
# Produces the proximal operator of the function f: ℝᵈ → ℝ:
#         prox(f, z) = argminₓ(f(x) + ½‖x-z‖₂²)
#############################################################################

export prox

function prox(f::Function, z::Array{Number})
  x = Variable(length(z))
  p = minimize(f(x) + 0.5 * norm(x - z))
  solve!(p)
  return y.value
end
