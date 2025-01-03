interval=${1}
pos=${2}

python ~/software/clues/inference.py \
    --times interval_${interval}/${pos} \
    --coal Average_100_individuals_Chr1_Hudson_pararelate_update.coal \
    --out interval_${interval}/${pos} \
    --burnin 100 \
    --timeBins timeBins.txt
