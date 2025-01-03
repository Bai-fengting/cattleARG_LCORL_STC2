chrom=${1}

bcftools reheader \
-f ~/00.referece/ARS-UCD1.2_Btau5.0.1Y.fa.fai \
--threads 2 \
../03.6191_filter_raw_tau_ind_beagle/Chr${chrom}-Run9-TAUIND-raw-toDistribute_filter_beagle.vcf.gz | \
bcftools annotate \
--set-id +'%CHROM\_%POS\_%REF\_%FIRST_ALT' \
-Oz \
-o Chr${chrom}-Run9-TAUIND-biallelic-beagle.vcf.gz

bcftools index -t Chr${chrom}-Run9-TAUIND-biallelic-beagle.vcf.gz