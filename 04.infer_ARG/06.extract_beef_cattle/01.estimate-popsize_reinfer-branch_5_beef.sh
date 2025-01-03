chrom=${1}

/storage/public/home/2021050457/software/relate_v1.1.9_x86_64_static/scripts/EstimatePopulationSize/EstimatePopulationSize_mod.sh \
-i /storage/public/home/2021050457/01.Cattle/01.ARG_beef/05.689_samples/01.run_relate/07.estimate-popsize_reinfer-branch_breed/02.extract_500_beef/Chr${chrom}_500_beef \
-m 1.26e-8 \
--poplabels /storage/public/home/2021050457/01.Cattle/01.ARG_beef/05.689_samples/01.run_relate/07.estimate-popsize_reinfer-branch_breed/02.extract_500_beef/Chr${chrom}_500_beef.poplabels \
--noanc 0 \
--threads 64 \
--years_per_gen 6 \
--num_iter 10 \
--threshold 0.5 \
--bins 2,6.6,0.1 \
--seed 1 \
-o Chr${chrom}_500_beef_reinfer
