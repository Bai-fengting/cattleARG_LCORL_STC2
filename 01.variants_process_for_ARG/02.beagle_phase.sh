chrom=${1}

java -Xmx110g \
-jar ~/software/beagle5.4/beagle.22Jul22.46e.jar \
gt=../02.6191_filter_raw_tau_ind/Chr${chrom}-Run9-TAUIND-raw-toDistribute_filter.vcf.gz \
nthreads=32 \
out=Chr${chrom}-Run9-TAUIND-raw-toDistribute_filter_beagle \
window=5 \
overlap=2