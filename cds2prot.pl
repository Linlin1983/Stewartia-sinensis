#!/usr/bin/perl -w
use strict;

####################################################################
#This script translates CDS to PROTEIN from fasta file
#Caution: The script use "Standard genetic codes"
#Author: Wencai Jie ( NJAU, China )
#Date: March 20, 2014
#Usage: perl cds2prot.pl cds.fa > prot.fa
####################################################################

unless ( $#ARGV >= 0 ){
	print "Usage: perl cds2prot.pl cds.fa > prot.fa\n";
	exit;
}	
my ($id,$protein) = ('','');
my ($i,$j)=(0,0);
my @id_a = ();
my %seq = ();

#reading Seq
foreach my $file (@ARGV){
	open SEQ, "<","$file" or die "Can't open file \"$file\" : $!\n";
	while (<SEQ>){
		chomp;
		if (/^>/){
			$id = $_;
			push @id_a,$_;
		} else {
			$_ = uc($_);
			$_ =~ s/U/T/g;
			$seq{$id} .= $_;
		}
	}
	close SEQ;
}

#translate
foreach my $key (@id_a){
	$j++;

#The 3 line below use to find the sequence id with bad codon.
#$id = (split /\s+/,$key)[0];
#$id =~ s/^>//;
#print STDERR "$j. $id\n";
	for(my $i=0;$i<(length($seq{$key})-2);$i+=3){
		my $codon=substr($seq{$key},$i,3);
		$protein.=&codon2aa($codon);
  	}
	$protein =~ s/(.{80})/$1\n/g;
  	print "$key\n$protein\n";
    	$protein = "";
}
print STDERR "Completed.\n\n";

#codon to amino acid
sub codon2aa{
	my ($codon)=@_;
my(%g)=('TCA'=>'S','TCC'=>'S','TCG'=>'S','TCT'=>'S','TTC'=>'F','TTT'=>'F','TTA'=>'L','TTG'=>'L','TAC'=>'Y','TAT'=>'Y','TAA'=>'X','TAG'=>'X','TGC'=>'C','TGT'=>'C','TGA'=>'X','TGG'=>'W','CTA'=>'L','CTC'=>'L','CTG'=>'L','CTT'=>'L','CCA'=>'P','CCC'=>'P','CCG'=>'P','CCT'=>'P','CAC'=>'H','CAT'=>'H','CAA'=>'Q','CAG'=>'Q','CGA'=>'R','CGC'=>'R','CGG'=>'R','CGT'=>'R','ATA'=>'I','ATC'=>'I','ATT'=>'I','ATG'=>'M','ACA'=>'T','ACC'=>'T','ACG'=>'T','ACT'=>'T','AAC'=>'N','AAT'=>'N','AAA'=>'K','AAG'=>'K','AGC'=>'S','AGT'=>'S','AGA'=>'R','AGG'=>'R','GTA'=>'V','GTC'=>'V','GTG'=>'V','GTT'=>'V','GCA'=>'A','GCC'=>'A','GCG'=>'A','GCT'=>'A','GAC'=>'D','GAT'=>'D','GAA'=>'E','GAG'=>'E','GGA'=>'G','GGC'=>'G','GGG'=>'G','GGT'=>'G','AAN'=>'X','GAN'=>'X','CAN'=>'X','TAN'=>'X','NAA'=>'X','CTK'=>'X','KTG'=>'X','GGS'=>'X','ATR'=>'X','TTW'=>'X','CCY'=>'X','GWG'=>'X','CMC'=>'X','TMA'=>'X','TWC'=>'X','GYW'=>'X','TAY'=>'X','WAA'=>'X','RTY'=>'X','WCA'=>'X','CTM'=>'X','ACM'=>'X','ATM'=>'X','GAK'=>'X','ARA'=>'X','GAS'=>'X','CGR'=>'X','ATK'=>'X','CRG'=>'X','AAS'=>'X','RGT'=>'X','RST'=>'X','WRT'=>'X','YCC'=>'X','YCA'=>'X','GGH'=>'X','AYA'=>'X','MAG'=>'X','GYM'=>'X','AKT'=>'X','GRC'=>'X','AWC'=>'X','TTM'=>'X','YAA'=>'X','CKG'=>'X','AWA'=>'X','TYT'=>'X','MCT'=>'X','TCY'=>'X','YTA'=>'X','GKC'=>'X','TYG'=>'X','RCA'=>'X','SAC'=>'X','AWG'=>'X','GAW'=>'X','YAT'=>'X','GGK'=>'X','RAR'=>'X','GRA'=>'X','CCK'=>'X','WTT'=>'X','WTG'=>'X','CTS'=>'X','AYC'=>'X','TWA'=>'X','YCR'=>'X','CAY'=>'X','KCC'=>'X','GMA'=>'X','CMG'=>'X','RTA'=>'X','GSA'=>'X','GMT'=>'X','MAT'=>'X','STT'=>'X','WCC'=>'X','YCG'=>'X','YGG'=>'X','GRT'=>'X','GYA'=>'X','MTT'=>'X','WTA'=>'X','CTY'=>'X','AMT'=>'X','MRA'=>'X','GGY'=>'X','MAG'=>'X','GTR'=>'X','AMY'=>'X','KGG'=>'X','TYC'=>'X','KTK'=>'X','ACK'=>'X','MCA'=>'X','GTM'=>'X','KYT'=>'X','TYA'=>'X','STC'=>'X','GTY'=>'X','GWT'=>'X','AGK'=>'X','TGW'=>'X','ART'=>'X','TCW'=>'X','CMT'=>'X','GAY'=>'X','KAG'=>'X','CCW'=>'X','ARG'=>'X','RAG'=>'X','YCT'=>'X','GAT'=>'X','KTA'=>'X','SCT'=>'X','RCC'=>'X','CAS'=>'X','YGT'=>'X','RAS'=>'X','CHT'=>'X','MGA'=>'X','AWT'=>'X','ACR'=>'X','TMT'=>'X','CGY'=>'X','CAW'=>'X','RTT'=>'X','ARC'=>'X','CSA'=>'X','WGT'=>'X','TKG'=>'X','TTR'=>'X','TTS'=>'X','YGC'=>'X','RCT'=>'X','AAY'=>'X','CWA'=>'X','RGG'=>'X','RAA'=>'X','TRT'=>'X','CMA'=>'X','CYA'=>'X','AKC'=>'X','YGA'=>'X','ASA'=>'X','RAT'=>'X','TAW'=>'X','CTW'=>'X','KGT'=>'X','GAM'=>'X','GCY'=>'X','AMA'=>'X','SAA'=>'X','KCA'=>'X','NAG'=>'X','AYT'=>'X','GTW'=>'X','CAM'=>'X','AYG'=>'X','SAG'=>'X','CGS'=>'X','MTA'=>'X','WAT'=>'X','RSR'=>'X','GMG'=>'X','TCR'=>'X','NAC'=>'X','STG'=>'X','KGC'=>'X','TCS'=>'X','SCA'=>'X','CRC'=>'X','AGR'=>'X','YTT'=>'X','GYT'=>'X','GGR'=>'X','CRA'=>'X','GTK'=>'X','NAT'=>'X','NAN'=>'X','AGN'=>'X','GKT'=>'X','GGN'=>'X','CGN'=>'X','TGN'=>'X','TGY'=>'X','TKC'=>'X','TRC'=>'X','NGA'=>'X','NGG'=>'X','NGC'=>'X','TTY'=>'X','CTR'=>'X','KCT'=>'X','YTC'=>'X','GRG'=>'X','WAC'=>'X','CRT'=>'X','TTK'=>'X','ACW'=>'X','GGM'=>'X','AAK'=>'X','RAC'=>'X','NNY'=>'X','GAR'=>'X','RTC'=>'X','ACY'=>'X','NGT'=>'X','NGN'=>'X','GYG'=>'X','ATY'=>'X','GTS'=>'X','ACN'=>'X','GCN'=>'X','CCN'=>'X','TCN'=>'X','NCA'=>'X','NCG'=>'X','NCC'=>'X','YTG'=>'X','CCM'=>'X','CYT'=>'X','NCT'=>'X','NCN'=>'X','ATN'=>'X','GTN'=>'X','AGY'=>'X','AGM'=>'X','SAT'=>'X','CTN'=>'X','TTN'=>'X','NTA'=>'X','NTG'=>'X','NTC'=>'X','NTT'=>'X','STA'=>'X','NTN'=>'X','ANA'=>'X','ANG'=>'X','ANC'=>'X','ANT'=>'X','ANN'=>'X','GNA'=>'X','GCR'=>'X','GKA'=>'X','AAR'=>'X','GNG'=>'X','GNC'=>'X','GNT'=>'X','GNN'=>'X','CNA'=>'X','CNG'=>'X','CNC'=>'X','CNT'=>'X','CNN'=>'X','TNA'=>'X','TNG'=>'X','TNC'=>'X','TNT'=>'X','TNN'=>'X','NNA'=>'X','NNG'=>'X','NNC'=>'X','NNT'=>'X','NNN'=>'X','RTG'=>'X','AXC'=>'X','GCM'=>'X','GYC'=>'X','GTD'=>'X','CAR'=>'X','AAW'=>'X');
	if(exists $g{$codon}){
		return $g{$codon};
	}else{
		print STDERR "\nBad codon \"$codon\"!!\n";
		print STDERR "Not Completed!\n";
		exit;
	}
}
