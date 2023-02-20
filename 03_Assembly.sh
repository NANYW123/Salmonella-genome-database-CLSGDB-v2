#!/bin/bash

##############Part3 Assembly: CleanData to Contigs###########################

Unicycler=~/bin/Unicycler
CleanData=./01_CleanData
Assembly=./02_Assembly

mkdir 02_Assembly

#single sample Assembly

$unicycler -1 ${CleanData}/${SampleID}_final_R1.fastq.gz -1 ${CleanData}/${SampleID}_final_R2.fastq.gz -o ./02_Assembly/${SampleID} -t 12

$unicycler --no_pilon --no_correct  --min_kmer_frac 0.6  --max_kmer_frac 0.99  --kmer_count 3  --min_fasta_length 500 -1 $CleanData/${SampleID}_1.fastq.gz -2 CleanData/${SampleID}_2.fastq.gz -o ./spades_out/${SampleID} -t 10

#return to initial directory
cd ../../