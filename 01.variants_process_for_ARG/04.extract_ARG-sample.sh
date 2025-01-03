chrom=${1}

bcftools view \
-S 689_samplelist.txt \
--threads 3 \
-Ou \
../04.6191_filter_raw_tau_ind_beagle_header_snpid/Chr${chrom}-Run9-TAUIND-biallelic-beagle.vcf.gz | \
bcftools view \
-i 'MAC>=1' \
--threads 3 \
-Oz \
-o Chr${chrom}_689_samples.vcf.gz 

bcftools index -t Chr${chrom}_689_samples.vcf.gz