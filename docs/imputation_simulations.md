# Strategies for chip design to aid with accurate imputation across multiple sub populations

One of the goals of the ADD cohort is to include a larger proportion of non-European ancestry individuals than previous studies have managed.

Questions arising:

- Can we ensure that the array design is able to obtain reasonable imputation accuracy of non-Europeans, if not parity with Europeans?
- Can this be done without abrogating the imputation quality of the European samples, who will constitute the majority of the data?
- Does a multi-population inclusive array design make it harder to compare Europeans in this dataset to other datasets of Europeans?


There are two broad approaches:

1. **Variant selection for post-imputation checking of reliable performance.** I suggested in the last call that it's unnecessary to include specific markers for this, as post-imputation checks can be obtained without ascertainment

2. **Variant selection optimised for imputation accuracy.** This will be discussed below


## Appraising variant selection for imputation accuracy across populations

The chip manufacturer is currently responsible for selecting the set of tagging variants that maximises coverage of variation in the genome. This will likely comprise ~700k variants. If we had a list of the proposed variants, we could evaluate the imputation performance in different populations by using existing diverse sequence panels that are not included in the [imputation reference panel](http://www.haplotype-reference-consortium.org/participating-cohorts).

- [Human Genome Diversity Panel (HGDP)](https://www.biorxiv.org/content/10.1101/674986v1.full.pdf) - 929 samples from 54 populations
- [Simons Genome Diversity Panel (SGDP)](https://reichdata.hms.harvard.edu/pub/datasets/sgdp/) - 300 samples from 142 populations

Combine these datasets to create a single sequence-level dataset. Then the imputation appraisal approach would be:

1. Choose a set of 700k SNPs as the variants from which imputation will be done
2. Select those SNPs from our sequence dataset
3. Impute against the HRC reference panel
4. Appraise the imputation accuracy by comparing against the masked sequence data

For a given set of 700k SNPs, we can appraise how well different populations fare in imputation accuracy. If we do this across multiple 700k SNP sets, it will give us a view of potential trade offs in improving non-European imputation accuracy.


## SNP sets to test

- Applied Biosystems UK Biobank Axiom Array
- Illumina Global Screening Array
- MVP 1.0 Genotyping Array


## Variations in imputation strategy

Imputing all populations together seems ideal, but running each population separately is also possible. It seems that Million Vets Program do not do this [here](https://www.nature.com/articles/s41588-018-0222-9#Sec14) or [here](https://www.nature.com/articles/s41591-019-0492-5#Sec2).



## Thoughts on creating a genome-wide coverage list from scratch

1. Get recombination map for each major population. 
2. For each recombination interval find a set of SNPs that tag all the haplotypes for that population
    - e.g. use LD scores. Take the one with the highest LD score, then factor out that variant and take the next highest LD score and so on
    - e.g. use PCA. Take PCA of the region, find how many PCs needed to explain e.g. 80% of the variance, and keep the variant with the top loading for each PC
3. Select SNPs to optimise maximum haplotype coverage across populations



## Related questions

- Question: how well has the UKBB chip performed on different ethnicities?
    + Calculate info scores on subsets of the samples
- Question: what is the guidance for phasing of diverse populations e.g. with EAGLE v3
- Question: Million vets program must have had to tackle this issue - what did they do?

