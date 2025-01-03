chrom=${1}

~/software/relate_v1.1.9_x86_64_static/scripts/RelateParallel/RelateParallel_mod.sh \
-m 1.26e-8 \
-N 10000 \
--haps ~/02.flip_hap/Chr${chrom}_689_samples_fliped.haps.gz \
--sample ~/02.flip_hap/Chr${chrom}_689_samples_fliped.sample.gz \
--map ~/recombMap/homogeneous_rates/chr${chrom}.map \
--seed 1 \
--painting 0.025,1 \
--memory 10 \
--threads_bt 16 \
--threads_ibl 64 \
-o Chr${chrom}_689_samples_ParallelRelate

gzip Chr${chrom}_689_samples_ParallelRelate.anc
gzip Chr${chrom}_689_samples_ParallelRelate.mut
