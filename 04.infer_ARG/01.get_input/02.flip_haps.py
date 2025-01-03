import gzip
import numpy as np
from pyfaidx import Fasta
from tqdm import tqdm
import click

@click.command()
@click.option('--fa_aa', required=True)
@click.option('--raw_haps', required=True)
@click.option('--chrom', required=True)
@click.option('--flip_haps', required=True)
def main(fa_aa, raw_haps, chrom, flip_haps):
    fa_aa = Fasta(fa_aa)
    progressbar = tqdm(total=len(fa_aa[chrom]), desc='fliping_chrom{:}'.format(chrom), unit='bp')
    with gzip.open(raw_haps, 'r') as f_raw, gzip.open(flip_haps, 'w') as f_flip:
        pos = 0
       # for line in tqdm(f_raw, total=len(fa_aa[chrom]), desc='chrom{:}'.format(chrom)):
        for line in f_raw:
            ls_line = line.decode().strip().split()
            head_info = ls_line[:3]
            progressbar.update(int(ls_line[2]) - pos)
            pos = int(ls_line[2])
            ls_alleles = ls_line[3:5]
            aa = fa_aa[chrom][pos-1: pos].seq
            if aa not in ls_alleles:
                print('ancestral allele not in alleles recoded in raw haps file at pos {:} \n'.format(pos))
            else:
                if ls_alleles.index(aa) == 0:
                    f_flip.write(line)
                else:
                    allele_info = [ls_alleles[1], ls_alleles[0]]
                    gt = np.array(ls_line[5:], dtype=int)
                    gt_reserve = (gt - 1) * (-1)
                    ls_new_line = head_info + allele_info + [str(a) for a in gt_reserve.tolist()]
                    f_flip.write((' '.join(ls_new_line) + '\n').encode())

if __name__ == '__main__':
    main()
