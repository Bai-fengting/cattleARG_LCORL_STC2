from pyfaidx import Fasta
import gzip
from tqdm import tqdm



fa_aa = Fasta('ARS-UCD1.2_Btau5.0.1Y_Ancestral-State.fa', one_based_attributes=False, mutable=True)
def replace_ancestral_state(chrom, aa_tsv, raw_fa):
    #get dictionary saving pos: aa
    with gzip.open(aa_tsv, 'r') as f_aa:
        dic_aa = {}
        f_aa.readline()
        for line in f_aa:
            line = line.decode().strip().split()
            if line[9] != 'ambiguous':
                dic_aa[int(line[1])] = line[9]
    #inplace
    for pos, aa in tqdm(dic_aa.items(), total=len(dic_aa), desc='chrom{:}'.format(chrom)):
        start, end = int(pos) - 1, int(pos)
        raw_fa[str(chrom)][start: end] = aa

for chrom in range(1, 30):
    replace_ancestral_state(
        chrom=chrom, 
        aa_tsv='chr{:}_ancestral_state.tsv.gz'.format(chrom), 
        raw_fa=fa_aa
    )
