breed=${1}
chrom=${2}
pos=${3}
seed=${4}

~/software/relate_v1.1.9_x86_64_static/scripts/SampleBranchLengths/SampleBranchLengths.sh \
    -i ~/04.reinfer_each_beef/${breed}/Chr${chrom}_${breed}_reinfer \
    -o chr${chrom}/${chrom}_${pos}/${breed}_${chrom}_${pos} \
    -m 1.26e-8 \
    --coal ~/04.reinfer_each_beef/${breed}/Chr${chrom}_${breed}_reinfer.coal \
    --format b \
    --first_bp ${3} \
    --last_bp ${3} \
    --seed ${seed} \
    --num_samples 200

python ~/software/clues/inference.py \
    --times chr${chrom}/${chrom}_${pos}/${breed}_${chrom}_${pos} \
    --coal ~/04.reinfer_each_beef/${breed}/Chr${chrom}_${breed}_reinfer.coal \
    --out chr${chrom}/${chrom}_${pos}/${breed}_${chrom}_${pos} \
    --burnin 100 \
    --timeBins timeBins.txt
