chrom=${1}

~/software/relate_v1.1.9_x86_64_static/bin/RelateFileFormats \
--mode ConvertFromVcf \
--haps Chr${chrom}_689_samples.haps \
--sample Chr${chrom}_689_samples.sample \
-i ~/Relate_beef/01.data/09.689_samples/Chr${chrom}_689_samples

gzip Chr${chrom}_689_samples.haps
gzip Chr${chrom}_689_samples.sample
