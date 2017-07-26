#############################################################################
# polyhedra.jl
# Handles constraints specifying the feasible region to be polyhedra
# associated with a submodular function f: 2ⱽ → ℝ, where V is the base set.
# The supported polyhedra are:
## The submodular polyhedron: Subpoly = {s ∈ ℝᵖ, ∀ A ⊆ V, s(A) ≤ F(A)}.
## The base polyhedron: Basepoly = {s ∈ ℝᵖ, s(V) = F(V), ∀ A ⊆ V, s(A) ≤ F(A)}
##                               = subpoly ∩ {s(V) = F(v)}.
## The positive polyhedron: Pospoly = {s ∈ ℝᵖ₊, ∀ A ⊆ V, s(A) ≤ F(A)}
##                                  = subpoly ∩ ℝᵖ₊.
## The symmetric submodular polyhedron: Sympoly = {s ∈ ℝᵖ, ∀ A ⊆ V, |s|(A) ≤ F(A)}
##                                              = {s ∈ ℝᵖ, |s| ∈ subpoly}.
# Here p = |V|, i.e. the cardinality of the base set.
#############################################################################

@compat abstract type PolyConstraint end
