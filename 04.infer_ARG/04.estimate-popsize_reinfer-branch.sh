chrom=${1}

~/software/relate_v1.1.9_x86_64_static/scripts/EstimatePopulationSize/EstimatePopulationSize_mod.sh \
-i ~/01.relate/Chr${chrom}_689_samples_ParallelRelate \
-m 1.26e-8 \
--poplabels ~/689_samples.poplabels \
--noanc 0 \
--threads 64 \
--years_per_gen 6 \
--num_iter 10 \
--threshold 0.5 \
--bins 2,6.6,0.1 \
--seed 1 \
-o Chr${chrom}_689_samples_ParallelRelate_update
