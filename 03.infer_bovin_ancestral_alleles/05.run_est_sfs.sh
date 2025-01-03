chrom=${1}

est-sfs \
05.config.txt \
chr${chrom}_sfs_input.txt \
05.seedfile.txt \
chr${chrom}_sfs.txt \
chr${chrom}_sfs_pvalue.txt
