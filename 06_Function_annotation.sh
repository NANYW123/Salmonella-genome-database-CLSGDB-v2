#!/bin/bash

##############Part6 Functional annotation###########################

Function=./05_Function
ResFinder=~/bin/run_resfinder.py
abricate=~/bin/abricate
SPIFinder=~/bin/spifinder.py
MobileElementFinder=~/bin/mefinder
PlasmidFinder=~/bin/plasmidfinder.py
blastp=~/bin/blastp

mkdir 05_Function

cd 05_Function
mkdir ResFinder_result PointFinder_result VFDB_result SPIFinder_result MobileElementFinder_result PlasmidFinder_result

#ResFinder

for name in `ls $path/02_Assembly/*.fasta`;do python3 run_resfinder.py -ifa ${name} -s 'salmonella' -l 0.9 -t 0.95 --acquired -o ${name%.fasta}_result && mv ${name%.fasta}_result $path/ResFinder_result ;done

#PointFinder

for name in `ls $path/02_Assembly/*.fasta`;do python3 run_resfinder.py -ifa ${name} -s 'salmonella' -l 1 -t 0.8 --point -o ${name%.fasta}_result && mv ${name%.fasta}_result $path/PointFinder_result;done

#VFDB

for name in `ls $path/02_Assembly/*.fasta`;do abricate --db salmonella ${name} > ../${name}.tab && mv ../${name}.tab $path/VFDB_result;done

#SPIFinder

for name in `ls $path/02_Assembly/*.fasta`;do python spifinder.py -i ${name} -l 0.6 -t 0.95 -p $path/spifinder_db -o . -x && mv results_tab.tsv ${name%.fasta}_tab.tsv && mv ${name%.fasta}_tab.tsv $path/SPIFinder_result ;done

#MobileElementFinder

for name in `ls $path/02_Assembly/*.fasta`;do mefinder find --min-coverage 0.9 -c ${name} -g ${name%.fasta} && \
awk -F ',' '{if($9>=0.9) print $0}' ${name%.fasta}.csv > ${name%.fasta}_filter.csv && \
mv ${name%.fasta}*.csv $path/MGEFinder_result ;done

#PlasmidFinder

for name in `ls $path/02_Assembly/*.fasta`;do python plasmidfinder.py -i ${name} -l 0.6 -t 0.8 -p $path/plasmidfinder_db -o . -x && mv results_tab.tsv ${name%.fasta}_tab.tsv && mv ${name%.fasta}_tab.tsv $path/Plasmidfinder;done

#return to initial directory
cd ../../