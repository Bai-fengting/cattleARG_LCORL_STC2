breed=${1}
chrom=${2}

/storage/public/home/2021050457/software/relate_v1.1.9_x86_64_static/scripts/EstimatePopulationSize/EstimatePopulationSize_mod.sh \
-i /storage/public/home/2021050457/01.Cattle/01.ARG_beef/05.689_samples/01.run_relate/03.extract_subpop/${breed}/Chr${chrom}_${breed} \
-m 1.26e-8 \
--poplabels /storage/public/home/2021050457/01.Cattle/01.ARG_beef/05.689_samples/01.run_relate/03.extract_subpop/${breed}/Chr${chrom}_${breed}.poplabels \
--noanc 0 \
--threads 10 \
--years_per_gen 6 \
--num_iter 10 \
--threshold 0.5 \
--bins 2,6.6,0.1 \
--seed 1 \
-o ${breed}/Chr${chrom}_${breed}_reinfer
