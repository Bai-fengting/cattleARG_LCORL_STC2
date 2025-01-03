chrom=${1}

bcftools view \
-i 'type="snp" & N_ALT=1 & STRLEN(REF)=1 & F_MISSING<0.22& FILTER!="VQSRTrancheSNP99.90to100.00" & MAC>1' \
--threads 3 \
-Ou \
~/01.1000_Bull_Genomes_data/rawvcf/Chr${chrom}-Run9-TAUIND-raw-toDistribute.vcf.gz | \
bcftools annotate \
-x ^INFO/AN,^INFO/AC,^FORMAT/GT \
--threads 3 \
-Oz \
-o Chr${chrom}-Run9-TAUIND-raw-toDistribute_filter.vcf.gz

bcftools index -t Chr${chrom}-Run9-TAUIND-raw-toDistribute_filter.vcf.gz