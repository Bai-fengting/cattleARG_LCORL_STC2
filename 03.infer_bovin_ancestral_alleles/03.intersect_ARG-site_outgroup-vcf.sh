f_arg_vcf=${1}
f_outgroup_vcf=${2}
f_out_vcf=${3}

python 03.intersect_ARG-site_outgroup-vcf.py \
--vcf_arg ${f_arg_vcf} \
--raw_vcf ${f_outgroup_vcf} \
--out_vcf ${f_out_vcf}