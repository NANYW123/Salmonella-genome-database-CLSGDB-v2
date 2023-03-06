#!/bin/bash

##############Part3 Assembly: CleanData to Contigs###########################

Unicycler=~/bin/Unicycler
CleanData=./01_CleanData
Assembly=./02_Assembly

mkdir 02_Assembly

#single sample Assembly

$unicycler -1 ${CleanData}/${SampleID}_final_R1.fastq.gz -1 ${CleanData}/${SampleID}_final_R2.fastq.gz -o ./02_Assembly/${SampleID} -t 12

#return to initial directory
cd ../../
