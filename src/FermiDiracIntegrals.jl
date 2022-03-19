module FermiDiracIntegrals

using Polylogarithms

export F

"""
Complete Fermi-Dirac-integral

Arguments:
* j
* x

Formula:
``{F_j(x) = \\frac{1}{\\Gamma(j+1)} \\int_0^{\\infty}{\\frac{t^j}{\\exp(t-x)+1}dt}}``

Implementation:
Using the polylogarithm
"""
function F(j,x)
    -polylog(j+1,-exp(x))
end

"""
Approximation of the complete Fermi-Dirac-integral for j = 1/2

Checked for a relative tolerance of 3% in the range x = -100:0.1:100

Speed: 100 times faster than the polylog version

Source:
J. S. Blakemore: Approximations for Fermi-Dirac Integrals. Solid-State Electronics, 25(11):1067-1076, 1982.
"""
function F(::Val{1/2},x) 
    if x < 1.3
        1/(exp(-x)+0.27)
    else
        4/3/sqrt(pi)*(x^2+pi^2/6)^(3/4)
    end
end

end
