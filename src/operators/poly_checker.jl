#############################################################################
# poly_checker.jl
# Uses the greedy algorithm to produce checkers for polyhedra associated with
# a submodular funciton f: 2ⱽ → ℝ, where V is the base set.
#############################################################################

function insubpoly{R <: Real}(f::Function, w::Array{R}) # The input function must be 0 at the empty set
  checker = true
  ordering = sortperm(w, rev=true)
  cert = 0
  ind = Set()
  for i = 1:length(w)
    cert += f(union(ind, Set([ordering[i]]))) - f(ind) - w[i]
    push!(ind, ordering[i])
    if cert < 0
      checker = false
      break
    end
  end
  return checker
end

function inbasepoly{R <: Real}(f::Function, w::Array{R}) # The input function must be 0 at the empty set
  checker = insubpoly(f, w)
  if checker == true
    check = (sum(w) == f(Set(collect(1:size(w, 1)))))
  end
  return checker
end

function inpospoly{R <: Real}(f::Function, w::Array{R}) # The input function must be 0 at the empty set
  checker = insubpoly(f, w)
  if checker == true
    checker = all(x -> x>=0, w)
  end
  return checker
end

function insympoly{R <: Real}(f::Function, w::Array{R}) # The input function must be 0 at the empty set
  checker = insympoly(f, abs(w))
  return checker
end
