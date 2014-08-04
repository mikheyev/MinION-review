#!/bin/bash
#$ -q short
#$ -j y
#$ -cwd
#$ -l h_vmem=20G
#$ -l virtual_free=20G
#$ -N rs
. $HOME/.bashrc
export TEMPDIR=/genefs/MikheyevU/temp
export TMPDIR=/genefs/MikheyevU/temp
export TEMP=/genefs/MikheyevU/temp
export TMP=/genefs/MikheyevU/temp

a=(data/raw/analyzed/?d.fastq) #2
f=${a["SGE_TASK_ID"-1]}
base=`basename $f .fastq`

blasr -sam -clipping soft -minMatch 7  -nproc 8 $f ref/NC_001416.fa | samtools view -Su - | novosort -m 16G -c 2 -i -o data/align/$base.bam -