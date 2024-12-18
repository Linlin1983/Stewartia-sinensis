#USAGE:python split_mcl_to_cds_pep.py mcl.out total.cds total.pep
import os
import shutil
import sys
from Bio import SeqIO
mcl=sys.argv[1]
cds=sys.argv[2]
pep=sys.argv[3]
dic_pep={}
dic_cds={}
for line in SeqIO.parse(pep, "fasta"):
	dic_pep[line.id]=line.seq
for line1 in SeqIO.parse(cds, "fasta"):
	dic_cds[line1.id]=line1.seq
for index, line in enumerate (open(mcl,"r")):
	index+=100000
	line=line.strip()
	gene_count=line.count("\t")
	if gene_count < 3:
		pass
	else:
		cds_out=open("OG_"+ str(index) +"_"+str(gene_count)+".cds","w")
		pep_out=open("OG_"+ str(index) +"_"+str(gene_count)+".pep","w")
		print (type(line.split("\t")))
		for gene in line.split("\t"):
			cds_out.write(">"+gene+"\n"+str(dic_cds[gene])+"\n")
			pep_out.write(">"+gene+"\n"+str(dic_pep[gene])+"\n")	
		cds_out.close()
		pep_out.close()
