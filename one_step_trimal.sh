mkdir 4_cds_aln/
perl /chenglin/hanqunwei/script/4.pal2nal_get_cds_aln.pl 3_aa_aln/ 2_cds/ 4_cds_aln/

mkdir 5_aa_trimal 6_cds_trimal                                                                     
perl /chenglin/hanqunwei/script/5.trimal_phylip.pl 3_aa_aln 5_aa_trimal   #trimal -in $file1 -out name[0].phy -automated1 -resoverlap 0.5 -seqoverlap 50 -colnumbering >$name[0].info

cd 5_aa_trimal
for i in `ls *.info`
do
id=$(basename $i .info)
java -jar /chenglin/hanqunwei/script/MySelection12.jar -l $id".phy" -i ../4_cds_aln/$id".aln" -o ../6_cds_trimal/$id".tmp"   
/chenglin/hanqunwei/script/trim4nal $i ../6_cds_trimal/$id".tmp"  > ../6_cds_trimal/$id".phy"
done
