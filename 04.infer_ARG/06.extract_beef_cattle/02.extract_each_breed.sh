chrom=${1}
pop=${2}

/storage/public/home/2021050457/software/relate_v1.1.9_x86_64_static/bin/RelateExtract \
--mode SubTreesForSubpopulation \
--anc /storage/public/home/2021050457/01.Cattle/01.ARG_beef/05.689_samples/01.run_relate/02.estimate-popsize_reinfer-branch/Chr${chrom}_689_samples_ParallelRelate_update.anc.gz \
--mut /storage/public/home/2021050457/01.Cattle/01.ARG_beef/05.689_samples/01.run_relate/02.estimate-popsize_reinfer-branch/Chr${chrom}_689_samples_ParallelRelate_update.mut.gz \
--poplabels /storage/public/home/2021050457/01.Cattle/01.ARG_beef/05.689_samples/01.run_relate/00.get_input/689_samples.poplabels \
--pop_of_interest ${pop} \
-o ${pop}/Chr${chrom}_${pop}

gzip ${pop}/Chr${chrom}_${pop}.anc
gzip ${pop}/Chr${chrom}_${pop}.mut
