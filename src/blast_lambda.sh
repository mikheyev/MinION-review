#!/bin/bash
#$ -q short
#$ -j y
#$ -cwd
#$ -N bt
#$ -l h_vmem=10G
#$ -l virtual_free=10G
. $HOME/.bashrc

a=(../data/lambda/?d.fasta) #2
f=${a["SGE_TASK_ID"-1]}
base=`basename $f .fasta`

blastn -evalue 1e-3 -gapopen 2 -gapextend 2 -word_size 15  -max_target_seqs 1 -num_threads 12 -db ../ref/lambda -query $f -outfmt 6 -out ../data/lambda/align/$base.txt

