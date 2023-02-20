#!/bin/bash

##############Part2 QC: Rawdata to CleanData###########################

fastqc=~/bin/fastqc
RawData=./00_RawData
CleanData=./01_CleanData
trimmomatic=~/bin/trimmomatic

#Before performing the whole-genome sequencing pipeline, copy the raw sequencing data into the directory '00_Rawdata'.
mkdir 00_RawData 01_CleanData

cd 00_Rawdata

#Before performing the pipeline, copy the raw sequencing data into the directory '00_Rawdata'.

##QC Step1: Quality assessment and generate reports for raw data

$fastqc -o <output_file_dir> <input_file_1_dir> <input_file_2_dir> 

### Step2: Remove adapter and low quality sequence by trimmomatic
cd 01_CleanData
$trimmomatic PE -phred33 <input_forward.fq.gz> <input_reverse.fq.gz> <output_forward_paired.fq.gz> <output_forward_unpaired.fq.gz> <output_reverse_paired.fq.gz> <output_reverse_unpaired.fq.gz> ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36 

#return to initial directory
cd ../
