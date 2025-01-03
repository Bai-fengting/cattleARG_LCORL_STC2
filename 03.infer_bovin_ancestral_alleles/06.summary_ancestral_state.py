#baifengting
#20230403

import numpy as np
import cyvcf2
import gzip
import click

@click.command()
@click.option('--chrom')
@click.option('--site_file')
@click.option('--freq_file')
@click.option('--sfs_file')
@click.option('--ref_vcf', help='Provide the reference and alternate states for each site in the SFS output file')
@click.option('--prefix_outfile', help='Generate two files with the specified prefix: prefix_outfile.tsv.gz and prefix_outfile.log')
def main(chrom, ref_vcf, site_file, freq_file, sfs_file, prefix_outfile):
    num_ance_maj = 0
    num_ance_min = 0
    num_ance_amb = 0
    dic_index2allele = {
        0: 'A', 1: 'C', 2: 'G', 3: 'T'
        }
    vcf_ref = cyvcf2.VCF(ref_vcf)
    dic_pos_ref_alt = {variant.POS: [variant.REF, variant.ALT[0]] for variant in vcf_ref}
    with open(site_file, 'r') as f_pos, \
    open(freq_file, 'r') as f_freq, \
    open(sfs_file, 'r') as f_p, \
    gzip.open('{:}.tsv.gz'.format(prefix_outfile), 'w') as f_anc:
        # Skip the first 8 lines in the sfs_file
        for c in range(8):
            f_p.readline()
        header = ['chrom', 'pos', 'cattle_ref', 'cattle_alt', 'cattle_maj', 'water_buffalo', 'sheep', 'white_tailed_deer', 'p_maj_anc', 'ancestral_allele']
        f_anc.write(('\t'.join(header) + '\n').encode())
        for line_pos, line_freq, line_p in zip(f_pos, f_freq, f_p):
            pos = int(line_pos.strip())
            ay_ref_alt = np.array(dic_pos_ref_alt[pos])
            ls_allele = []
            for gt in line_freq.strip().split(' '):
                if gt == '0,0,0,0':
                    ls_allele.append('N')
                else:
                    ls_allele.append(dic_index2allele[np.argmax(np.array(gt.split(','), dtype=int))])
            maj_allele = ls_allele[0]
            p_value = float(line_p.strip().split(' ')[2])
            if p_value > 0.8:
                anc_allele = ls_allele[0]
                num_ance_maj += 1
            elif p_value < 0.2:
                anc_allele = ay_ref_alt[ay_ref_alt != maj_allele][0]
                num_ance_min += 1
            else:
                anc_allele = 'ambiguous'
                num_ance_amb += 1
            line_out = [chrom, pos] + list(ay_ref_alt) + ls_allele + [p_value, anc_allele]
            f_anc.write(('\t'.join([str(x) for x in line_out]) + '\n').encode())
    with open('{:}.log'.format(prefix_outfile), 'w') as f_log:
        f_log.write(
            'sites for infer ARG:\t{:}\n'.format(len(dic_pos_ref_alt)) + \
            'sites for infer ancstral state:\t{:}\n'.format(np.sum(num_ance_maj + num_ance_min + num_ance_amb)) + \
            'major allele infered as ancestral allele:\t{:}\n'.format(num_ance_maj) + \
            'minor allele infered as ancestral allele:\t{:}\n'.format(num_ance_min) + \
            'ancestral allele infered as ambiguous:\t{:}\n'.format(num_ance_amb)
        )
if __name__ == '__main__':
    main()
