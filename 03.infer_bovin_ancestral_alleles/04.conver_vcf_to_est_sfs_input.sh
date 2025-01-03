chrom=${1}

python 04.conver_vcf_to_est_sfs_input.py \
--vcf_ref ../02.79_representative_inds/Chr${chrom}-79_representative_individuals.vcf.gz \
--vcf_outgroup1 ../01.pairwise_align_vcf_remove_redundancy/chr${chrom}_ARS_UCD_addY-WaterBuffalo_rm.vcf.gz \
--vcf_outgroup2 ../01.pairwise_align_vcf_remove_redundancy/chr${chrom}_ARS_UCD_addY-Sheep_rm.vcf.gz \
--vcf_outgroup3 ../01.pairwise_align_vcf_remove_redundancy/chr${chrom}_ARS_UCD_addY-WhiteTailedDeer_rm.vcf.gz \
--outfile chr${chrom}_sfs_input.txt
