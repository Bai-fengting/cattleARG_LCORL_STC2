~/software/relate_v1.1.9_x86_64_static/bin/RelateFileFormats \
--mode GenerateSNPAnnotations \
--haps Average_100_individuals_Chr1_Hudson.haps.gz \
--sample Average_100_individuals_Chr1_Hudson.sample.gz \
--poplabels Average.poplabels \
--mut Average_100_individuals_Chr1_Hudson_pararelate.mut.gz \
-o Average_100_individuals_Chr1_Hudson_pararelate

rm Average_100_individuals_Chr1_Hudson_pararelate.mut.gz
gzip Average_100_individuals_Chr1_Hudson_pararelate.mut
