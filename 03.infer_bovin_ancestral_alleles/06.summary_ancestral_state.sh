chrom=${1}

python summary_ancestral_state.py \
--chrom ${chrom} \
--site_file ../03.get_est-sfs_input/chr${chrom}_sfs_input.txt.site \
--freq_file ../03.get_est-sfs_input/chr${chrom}_sfs_input.txt \
--sfs_file ../04.run_est-sfs/chr${chrom}_sfs_pvalue.txt \
--ref_vcf ../02.79_representative_inds/Chr${chrom}-79_representative_individuals.vcf.gz \
--prefix_outfile chr${chrom}_ancestral_state
