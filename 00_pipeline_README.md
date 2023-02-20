##### Drivers and landscape of antibiotic resistome, virulome and mobilome in the Salmonella genome database of over 8,000 isolates in China.

This directory contains scripts related to the manuscript "Drivers and landscape of antibiotic resistome, virulome and mobilome in the Salmonella genome database of over 8,000 isolates in China". 
Before running, you must ensure that all required softwares and databases are installed successfully.

###### How to Reference?  
If you have used this script in your research, please use the following link for references to our script: https://github.com/NANYW123/Salmonella-CLSGDB.git.
Please also cite the corresponding software.

### Software and database installation

Most of the softwares can be installed through [conda](https://www.anaconda.com/products/individual). The installation method refer to the manual of each software. The following published software is used in our script.
The name, version and availablity of the software are as follows:  

|Software|Availability|
|:--------|:-----------|
|Trimmomatic(v0.36) | https://github.com/usadellab/Trimmomatic|
|BLAST (v2.10.1+)ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/|
|Unicycler (v0.4.7) | https://github.com/rrwick/Unicycler|
|Prokka (v1.13.3) | https://github.com/tseemann/prokka|
|SeqSero2 (v1.1.1) | https://github.com/denglab/SeqSero2|
|SISTR (v4.0.0) | https://github.com/phac-nml/sistr_cmd|
|MLST (v2.0) | https://bitbucket.org/genomicepidemiology/mlst_db/src/master/|
|ABRicate (v0.9.7) | https://github.com/tseemann/abricate|
|VFDB (2019) | http://www.mgc.ac.cn/VFs/download.htm|
|PlasmidFinder (v2.0.1) | https://bitbucket.org/genomicepidemiology/plasmidfinder_db/src/master/|
|ResFinder (v4.0) | https://bitbucket.org/genomicepidemiology/resfinder_db/src/master/|
|PointFinder (accessed at January 28, 2021) | https://bitbucket.org/genomicepidemiology/pointfinder_db/src/master/|
|SPIFinder (v2.0) | https://bitbucket.org/genomicepidemiology/spifinder_db/src/master/|
|MobileElementFinder (v1.0.3) | https://bitbucket.org/mhkj/mge_finder/src/master/|
|Venn Diagrams | (http://bioinformatics.psb.ugent.be/webtools/Venn/)
|ImageGP platform | (http://www.ehbio.com/ImageGP/)
|PHYLOViZ 2.0 | (http://www.phyloviz.net/)

### Note: The version are only the version used in the paper, most of database are constantly updated.

### OVERVIEW OF PIPELINE

The scripts of whole-genome sequencing analysis are placed in "[Pipeline](https://github.com/NANYW123/Salmonella-CLSGDB.git)" directory. There are six steps in the pipeline, Drivers and landscape of antibiotic resistome, virulome and mobilome in the Salmonella genome database of over 8,000 isolates in China.

#### Part1: 01_Salmonella_genomes_China-download

We screened and summarized the metadata of publicly available Salmonella assembly genomes from the National Center of Biotechnology Information BioSample (NCBI BioSample, https://www.ncbi.nlm.nih.gov/biosample/, as of September 25, 2022). A total of 6187 publicly available Salmonella assembly genomes from human, animal, aquatic animal, animal food products environment, and other sources from China were obtained from the NCBI assembly (https://www.ncbi.nlm.nih.gov/assembly/).

#### Part2: 02_data_preprocessing.sh

whole-genome sequencing data pre-processing: adapters and low-quality regions (read trimming) read removal, generating high-quality sequence. 

#### Part3: 03_Assembly.sh

whole-genome sequencing sequence assembly: Assemble short reads into long contigs.

#### Part4: 04_Gene_prediction.sh 

Annotation of genome sequences were performed, the number of contigs, and protein-coding sequence (CDS) of each isolate are summarized.

#### Part5: 05_Sequence_typing.sh 

A total of three scripts in this modules, including serovar prediction, and multilocus sequence typing (MLST version 2.0).
Salmonella serovars were predicted using the SeqSero2 version 1.1.1 (Salmonella Serotyping by Whole Genome Sequencing) and SISTR version 4.0.0 (Salmonella in silico typing resource), and sequence types (STs) were used to determine.

#### Part6: 06_Function_annotation.sh

The acquired antimicrobial resistance genes and antimicrobial resistance associated with genomic point mutations, virulence factors, Salmonella Pathogenic Islands, mobile genetic elements, plasmid replicon types annotation were performed by aligning the genome sequence to ResFinder, PointFinder, VFDB, SPIFinder, MobileElementFinder and PlasmidFinder databases.

### Statistical analysis and visualization

Multiple comparisons were performed by the Kruskal-Wallis test and Mann Whitney U test (unpaired t-test) using GraphPad Prism version 9.0. Interactions between the sampling period, host, serovar, and geographic regions were used to identify specific dynamics. Venn diagrams were drawn using Venn Diagrams (http://bioinformatics.psb.ugent.be/webtools/Venn/). Heatmaps were plotted using the ImageGP platform (http://www.ehbio.com/ImageGP/). The minimum spanning tree of multi-locus STs was generated using PHYLOViZ 2.0 (http://www.phyloviz.net/).
## Limitations
 
This workflow was designed specifically for "Drivers and landscape of antibiotic resistome, virulome and mobilome in the Salmonella genome database of over 8,000 isolates in China"; editing and revisions might be required before applying to other projects.