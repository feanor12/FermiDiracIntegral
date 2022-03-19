# FermiDiracIntegral

[![Build Status](https://github.com/feanor12/FermiDiracIntegral.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/feanor12/FermiDiracIntegral.jl/actions/workflows/CI.yml?query=branch%3Amain)

Implements the complete Fermi-Dirac-integral ([Wikipedia](https://en.wikipedia.org/wiki/Complete_Fermi%E2%80%93Dirac_integral))

The general implementaion uses [Polylogarithms.jl](https://github.com/mroughan/Polylogarithms.jl), but there is also an approximaton for `F(1/2,x)` available.

The approximated version can be called like this:

```julia
julia> using FermiDiracIntegral

julia> F(Val(1/2),1)
1.5676943564187247
```

and the gerneral polylogarithm implementation can be used like this:

```julia
julia> using FermiDiracIntegral

julia> F(1/2,1)
1.575640776151315 - 0.0im
```

Benchmark:

```julia
julia> using BenchmarkTools

julia> using FermiDiracIntegral

julia> @btime F(1/2,1)
  64.742 μs (18 allocations: 512 bytes)
1.575640776151315 - 0.0im

julia> @btime F(Val(1/2),1)
  0.698 ns (0 allocations: 0 bytes)
1.5676943564187247

```
