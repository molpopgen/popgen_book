#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3": chart, plot

= Hardy-Weinberg equilibrium

This section gives a derivation of Hardy-Weinberg equilibrium ("HWE" for short) for the case of one locus with two alleles at an autosomal locus in a diploid population.

== Alleles and allele frequencies

#let A = emph[A]
#let a = emph[a]

Consider the case of two alleles, #A and #a, at an auutosomal locus in a population of #emph[N] diploids.
If there are #emph[P] copies of #A and #emph[Q] copies of #a, then the #emph[frequencies] of the two alleles are #math.equation(block: true, alt: "Frequency of the #emph[A] allele", $p = frac(P, 2N)$) and #math.equation(block: true, alt: "Frequency of the #emph[a] allele.", $q = frac(Q, 2N),$) respectively.

Note that:

- #math.equation(alt: "Sum of allele counts equals 2N", $P + Q = 2N$) due to individuals being diploid.
- #math.equation(alt: "Allele frequencies sum to 1", $p + q = 1$).

== Assumptions

We make the following simplifying assumptions:

- The number of diploids is infinitely large.
- Each individual produces both sperm and eggs (gametes).
- Each individual produces infinitely many gametes of each type.
- Each individual has the same reproductive output. (This is equivalent to assuming no natural selection!)
- Gametes mix at random to generate offspring.  (Sometimes called "random mating" or "random union of gametes".)
- There is no mutation from one allele to the other.

== Genotype frequencies in the next generation

The genotypes in the next generation are given by #math.equation(block: false, alt: "Genotype frequencies in the next generation", $(p+q)^2 = p^2 + 2 p q + q^2$).

To get to the previous equation:

+ To generate a single offspring, we have to "reach in" to our infinitely large pool of gametes twice.
  (Twice because we need to "fill" two spots for alleles in diploids.)
+ Each time we reach for a gamete, we get an #A with probability #emph[p] #strong[or] an #a with probability #emph[q].
  This sampling is an "or" situation, so the total probability is #emph[p + q].
  (You will note that this probabilty sums to 1.
  This is not an error.)
  The probabilty that we sample an allele is indeed 1.
  The sum #emph[p + q] just records for us the probabilities of sampling each possible allele.)
+ We need to repeat the allele picking process twice.
  Since our gamete pool is infinitely large, the probabilities of picking each allele do not change with each subsequent draw.
+ The final genotype is an #strong[and] statment, meaning we need to multiply probabilities together, which gives us #emph[(p+q)#super[2]].
+ This expression expands to the sum of the probabilities of each genotype.

An alternate approach is to invert the logic:

+ The offspring could be #A#A, which means picking #A twice. "#A #strong[and] #A" has probability #emph[p#super[2]].
+ The offspring could be #A#a, which means picking #A first then #a #emph[or] #a first then #A.
  The probability is #emph[pq + qp], or #emph[2pq].
+ The offspring could be #a#a, which means picking #a twice. "#a #strong[and] #a" has probability #emph[q#super[2]].

== Allele freqiencies in the offspring generation

Let's define #math.equation(alt: "symbol for frequency of #A in the next generation", $p'$) as the frequency of #A in the offspring generation.
We will also define #math.equation(alt: "symbol for the number of copies of #A in the offspring generation", $P'$) as the number of copies of #A in the offspring generation.

The #emph[number] of #A alleles in the next generation is #math.equation(block: true, alt: "Number of copies of #A in the offspring generation", $P'=2 N p^2 + frac(2 N, 2) times 2 p q$).
Therefore, the #emph[frequency] of #A in the next generation is #math.equation(block: true, alt: "Frequency of #A in the next generation", $p' &= frac(2 N p^2 + frac(2 N, 2) times 2 p q, 2 N)\ &= frac(2 N p^2 + 2 N p q, 2 N)\ &= p^2 + p q \ &= p(p+q) \ &= p$)

It follows that the frequency of #a in the offspring generation is #emph[q].

== Implications

The allele frequency change in a single generation is exactly zero!
We see this from #math.equation(alt: "Demonstrate no change in allele frequency", block: true, $Delta p &= p' - p \ &= p - p \ &= 0$).

The symbol #math.Delta is often used to indicate "change".
The previous equation uses it to denote the change in the frequency of #A in a single generation.
This notation is very common in poplation genetics!

The lack of change implies that allele emph are in #emph[equilibrium].
Note that the equilibrium is reached #emph[without] having to specify the initial starting conditions (allele and/or genotype frequencies in the parental generation).

Further note that the #emph[genotype] frequencies will remain unchanged in all future generations.
To see that genotype frequencies remain constant, work out what will happen in the next offspring generation.
(In other words, the grand-child generation with respect to our initial parental generation.)

A major implication of HWE is that the genotype frequencies are specific functions of the allele frequencies (#ref(<hwegenofreqs>)).
Given an allele frequency, #emph[p], the frequency of the genotype homozygous for that allele is #emph[p#super[2]].
The frequency for the heterozygous genotype is #emph[2pq] and the frequency of the other homozygote is #emph[q#super[2]].
#ref(<hwegenofreqs>) plots the relationship between allele and genotype frequency under HWE.

#figure(
  cetz.canvas({
    plot.plot(
      size: (10, 10),
      x-label: [Allele frequency],
      y-label: "Genotype frequency",
      x-ticks: (0, 0.5, 1),
      y-ticks: (0, 0.5, 1),
      {
        plot.add(
          p => p * p,
          domain: (0, 1),
          label: "Homozygote",
          style: (stroke: (thickness: 0.1, paint: rgb("#440154FF"))),
        )
        plot.add(
          p => 2 * p * (1 - p),
          domain: (0, 1),
          label: "Heterozygote",
          style: (stroke: (thickness: 0.1, paint: rgb("#20A387FF"))),
        )
        plot.add(
          p => (1 - p) * (1 - p),
          domain: (0, 1),
          label: "Alternate homozygote",
          style: (stroke: (thickness: 0.1, paint: rgb("#FDE725FF"))),
        )
      },
    )
  }),
  caption: [When a population is in Hardy-Weinberg equilibrium ("HWE"), the genotype frequencies are precise functions of the underlying allele frequencies.
    The #emph[x] axis represents the allele frequency.
    This is the frequency of our "focal" allele that we currently care about.
    Depending on the context, this could be a disease-causing mutation, or any mutation that we label with symbols such as #A or #a.
    The #emph[y] axis shows the frequencies of the three possible genotypes.
    First, we have the genotype that is homozygouse for our "focal" allele.
    Second, the heterozygous genotype.
    Finally, the genotype homozygous for the alternate allele (the allele that is not our "focal" allele).
  ],
  alt: "Graph showing genotype frequencies as a function of the frequency of the #A allele.",
) <hwegenofreqs>
