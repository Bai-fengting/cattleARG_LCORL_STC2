~/software/relate_v1.1.9_x86_64_static/scripts/RelateParallel/RelateParallel_mod.sh \
-m 1.26e-8 \
--Ne 10000 \
--haps Average_100_individuals_Chr1_Hudson.haps.gz \
--sample Average_100_individuals_Chr1_Hudson.sample.gz \
--map ~/01.genetic_map/chr1.map \
--seed 1 \
--painting 0.025,1 \
--memory 20 \
--threads_bt 20 \
--threads_ibl 64 \
-o Average_100_individuals_Chr1_Hudson_pararelate

gzip Average_100_individuals_Chr1_Hudson_pararelate.anc
gzip Average_100_individuals_Chr1_Hudson_pararelate.mut
