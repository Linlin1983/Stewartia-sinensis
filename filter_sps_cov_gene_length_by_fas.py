#!/usr/bin/env python
# coding: utf-8
#Usage: put this script in the fas folder, and run python filter_sps_cov_gene_length_by_fas.py 

from Bio import SeqIO
import glob
import pandas as pd

fas_list = glob.glob("*.fas")


out_file = set()
for fas in fas_list:
    dic_fas = {}
    #out_file = set()
    for line in SeqIO.parse(fas,"fasta"):
        dic_fas[line.id] = line.seq
        sps = set()
        for gene in dic_fas.keys():
            if len(dic_fas[gene]) > 400:
                sps.add(gene.split("_")[0])
        sps_count = len(sps)
        if sps_count < 5:
            pass
        else:
            out_file.add(fas)

df = pd.DataFrame(out_file,index=None)
df.to_csv('filter_fas.csv',header=None,index=None)

