#############################################################################
# card.jl
# Handles submodular functions created by concave functions acting on
# cardinality functions.
# We use Card(f::AbstractExpr) for now, would be more user-friendly if we can
# use f(length(S::Set{Int})).
#############################################################################

import Convex.solve!
export solve!

type Card <: AbstractExpr
  head::Symbol
  id_hash::UInt64
  children::Tuple{AbstractExpr}
  size::Tuple{Int, Int}

  function Card(x::AbstractExpr)
    children = (x, )
    return new(:card, hash(children), children, x.size)
end

function solve!(card::Card) # Will take a general form in the future
end
