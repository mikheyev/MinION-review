#!/bin/bash
#$ -q short
#$ -j y
#$ -cwd
#$ -N align
#$ -l h_vmem=40G
#$ -l virtual_free=40G
. $HOME/.bashrc
forward=../data/snake/miseq/Pf_S1_L001_R1_001.fastq.gz
reverse=../data/snake/miseq/Pf_S1_L001_R2_001.fastq.gz

f=../data/snake/1d.fasta
base=`basename $f .fasta`

bowtie2 --phred64 --very-sensitive-local -p 6 -x ../data/snake/$base -1 $forward -2 $reverse | samtools view -Su -F4   - | novosort -c 2 --ram 10G  -t /genefs/MikheyevU/temp -i -o ../data/snake/align/$base"_illumina.bam" -


