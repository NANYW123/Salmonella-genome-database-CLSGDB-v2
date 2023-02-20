#!/bin/bash

##############Part5 Sequence typing###########################

CleanData=./01_CleanData
Assembly=./02_Assembly
Gene_prediction=./03_Gene_prediction
Sequence_typing=./04_Sequence_typing
SeqSero2=~/bin/SeqSero2_package.py
SISTR=~/bin/SISTR
mlst=~/bin/mlst.py

mkdir 04_Sequence_typing
cd 04_Sequence_typing
mkdir SeqSero2_result SISTR_result mlst_result

#Salmonella Serotyping by Whole Genome Sequencing
cd SeqSero2_result
$time for name in `ls ./02_Assembly/*.fasta`;do SeqSero2_package.py -m k -t 4 -i ${name} ;done

#Salmonella in silico typing resource
cd SISTR_result
$sistr --qc -vv --alleles-output allele-results.json --novel-alleles novel-alleles.fasta --cgmlst-profiles cgmlst-profiles.csv -f tab -o sistr-output.tab ./02_Assembly/${SampleID}.fasta  

#multilocus sequence typing

$python mlst.py -i ./02_Assembly/${SampleID}.fasta -o mlst_result -s senterica -p $path/mlst_db/

#return to initial directory
cd ../../