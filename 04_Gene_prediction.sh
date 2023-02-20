#!/bin/bash

##############Part4 Gene prediction###########################

CleanData=./01_CleanData
Assembly=./02_Assembly
Gene_prediction=./03_Gene_prediction
prokka=./bin/prokka

mkdir 03_Gene_prediction
cd ${03_Gene_prediction}
mkdir 01_sample_list 02_prokka-result

###Gene prediction
cd 02_Assembly

for name in `ls ./01_sample_list/*.fasta`;do prokka ${name} -outdir ${name%.fasta} --force \
mv ${name%.fasta} ./03_Gene_prediction/prokka-result; done

#return to initial directory
cd ../../


