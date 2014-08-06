# Source code for MinION review

## align_illumina.sh

Use stampy to align Illumina GAII reads to the MinION *P. flavoviridis* reads

## align_lambda.sh

Use BLASR to align MinION reads to the lambda reference

## align_snake.sh

Use BLASR to align MinION reads to the *P. flavoviridis* reference

## blast_lambda.sh

Use BLASTN to align MinION reads to the lambda reference

## blast_snake.sh

Use BLASTN to align MinION reads to the *P. flavoviridis* reference

## convert.py

Concert FAST5 to FASTQ

## MinION mapped reads.Rmd

R script for descriptive statistics and plots

## parse_blast_nr_lambda.py

Extract results from BLASTN vs NCBI nr database for lambda MinION reads

## parse_blast_nr_snake.py

Extract results from BLASTN vs NCBI nr database for *P. flavoviridis* MinION reads

## parse_insertions.py

Extract frequencies of insertions and other statistics from BLAST alignments to the lambda genome reference.

Frequencies of bases in insertions in the 2D workflow:

	A 4602
	C 5643
	T 4371
	G 5704
	N 6132