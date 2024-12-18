
INPUT_DIR=3_pep
mkdir 3_aa_aln
cd $INPUT_DIR
for file in `ls *.pep`
do
export code=${file%.pep}
mafft --thread 4 --auto $file > ../3_aa_aln/$code".out"
done;
