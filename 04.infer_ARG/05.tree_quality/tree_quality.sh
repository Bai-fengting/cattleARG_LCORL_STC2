chrom=${1}

~/software/relate_v1.1.9_x86_64_static/bin/RelateSelection \
--mode Quality \
-i ~/02.estimate-popsize_reinfer-branch/Chr${chrom}_689_samples_ParallelRelate_update \
-o Chr${chrom}_689_samples_ParallelRelate_update

gzip Chr${chrom}_689_samples_ParallelRelate_update.qual
