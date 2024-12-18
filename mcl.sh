mcxload -abc blast_bitscore.txt --stream-mirror -o blast_bitscore.mcl_out.mci -write-tab blast_bitscore.mcl_out.tab
mcl blast_bitscore.mcl_out.mci -I 5.0 -o out.blast_bitscore.mcl_out.mci.I50
mcxdump -icl out.blast_bitscore.mcl_out.mci.I50 -tabr blast_bitscore.mcl_out.tab -o blast_bitscore.dump.mcl_out.mci.I50
