chrom=${1}

~/software/relate_v1.1.9_x86_64_static/bin/RelateFileFormats \
--mode GenerateSNPAnnotations \
--haps ~/02.flip_hap/Chr${chrom}_689_samples_fliped.haps.gz \
--sample ~/02.flip_hap/Chr${chrom}_689_samples_fliped.sample.gz \
--poplabels ~/689_samples.poplabels \
--ancestor ~/06.replace_referece_with_aa/ARS-UCD1.2_Btau5.0.1Y_Ancestral-State.fa \
--mut Chr${chrom}_689_samples_ParallelRelate.mut.gz \
-o Chr${chrom}_689_samples_ParallelRelate

rm Chr${chrom}_689_samples_ParallelRelate.mut.gz; 
gzip Chr${chrom}_689_samples_ParallelRelate.mut;
gzip Chr${chrom}_689_samples_ParallelRelate.annot

