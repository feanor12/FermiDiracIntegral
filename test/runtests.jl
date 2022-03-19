using FermiDiracIntegrals
using Test

@testset "FermiDiracIntegrals.jl" begin
    for x in -10:10
        @test isapprox(F(0,x),log(1+exp(x))) 
    end

    for x in -100:0.1:100
        @test isapprox(F(0.5,x),F(Val(1/2),x),rtol=0.03) 
    end
   
    ## https://royalsocietypublishing.org/doi/pdf/10.1098/rspa.1950.0183
    @test isapprox(F(1,-4),0.0182324,atol=1e-7) 
    @test isapprox(F(2,-4),0.0182739,atol=1e-7) 
    @test isapprox(F(3,-4),0.0182947,atol=1e-7)
    @test isapprox(F(4,-4),0.0183052,atol=1e-7)

    @test isapprox(F(1,-1.3),0.2559184,atol=1e-7) 
    @test isapprox(F(2,-1.3),0.2639215,atol=1e-7) 
    @test isapprox(F(3,-1.3),0.2681202,atol=1e-7)
    @test isapprox(F(4,-1.3),0.2702891,atol=1e-7)

    @test isapprox(F(1,0),0.8224670,atol=1e-7) 
    @test isapprox(F(2,0),0.9015427,atol=1e-7) 
    @test isapprox(F(3,0),0.9470328,atol=1e-7)
    @test isapprox(F(4,0),0.9721198,atol=1e-7)
end
