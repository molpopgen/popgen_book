#let A = emph[A]
#let a = emph[a]

= Allele and genotype frequencies

== Introduction

== Basic definitions

- A frequency is a real number #math.equation(alt: "greater than or equal to zero", $>= 0$) and #math.equation(alt:"less than or  equal to one", $<= 1$).

When a frequency of something is equal to zero, that thing is absent.
For example, an allele frequency of zero means that the allele is not present.

When a frequency is equal to one, then the item in question is the only item present.

We need to distinguish two different types of frequencies:

- The frequency of something in the entire population.
- The frequency of something in a #emph[sample] taken from a population.

To see how these quantities differ, but are related: 
  
Consider a case were the #A#a genotype is present in 20% of individuals in the entire population.
This is a statement about #emph[every] individual in, say, the entirety of contemporary Europe.
When we study genetic variation in populations, we do so by studying a #emph[sample] of invididuals.
For example, we may genotype 100 individuals from contemporary Europe.
If each individual is unrelated (not a first or second degree relative, say), then the probability that an individual has an #A#a genotype will be 20%.
This sampling process means that the frequency of this genotype in our sample is unlikely to be exactly 20%.

In many cases, statements about the frequencies of things in the entire population are limited to discussions of theoretical models.
For example, mathematical models of natural selection will let us describe the entire path of frequencies taken by a mutation in the whole population.

== Examples

=== "Classic" genetics class data

You have the following diploid genotypes for an autosomal locus:

#let nAA = 37
#let nAa = 63
#let naa = 20

- #nAA #A#A
- #nAa #A#a
- #naa #a#a

What is the frequency of #A?

==== Fully detailed solution

To solve this:

#let n = 37 + 63 + 20
#let num_alleles = (n, 2).product()
#let num_copies = (2*nAA + nAa)
#let result = num_copies/num_alleles

- We have a total of #n genotypes in our data.
- We therefore have #num_alleles alleles in our data (due to organisms being diploid)
- Each #A#A individual has two copies of #A.
- Each #A#a genotype has one copy
- Therefore, the number of copies of #A in our data is (#(2,nAA).product() + #nAa) which equals #num_copies.
- Finally, our frequency is #num_copies / #num_alleles, which is #result.

==== Quick method

For people who understand the method used above, the quick way to get allele frequency data from genotype data is to get the sum of the homozygote frequency with half the heterozygote frequency.

#let result = nAA/n + 0.5 * nAa/n
For our data, that sum is #nAA/#n + #math.equation(alt: "one-half",$frac(1,2)$)#nAa/#n, which equals #result.
