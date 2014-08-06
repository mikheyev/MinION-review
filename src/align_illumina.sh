#!/bin/bash
#$ -q genomics
#$ -j y
#$ -cwd
#$ -N align
#$ -l h_vmem=40G
#$ -l virtual_free=40G
. $HOME/.bashrc
forward=../data/snake/illumina/GGCTAC_pe1.fq.gz 
reverse=../data/snake/illumina/GGCTAC_pe2.fq.gz 

f=../data/snake/1d.fasta
base=`basename $f .fasta`

stampy.py --sensitive --solexa --substitutionrate=0.12 -t12 -g ../data/snake/pf -h ../data/snake/pf -M $forward $reverse | samtools view -Su -F4 - | novosort -c 6 --ram 20G  -t /genefs/MikheyevU/temp -i -o ../data/snake/align/$base"_illumina.bam" -
