#!/bin/bash

#MSUB -A w10001
#MSUB -l walltime=00:15:00
#MSUB -j oe
#MSUB -q short
#MSUB -l nodes=1:ppn=1

# BEFORE RUNNING THIS SCRIPT, make sure that the orf_trans.fasta file is accessible in your $DATADIR folder
# e.g. by running the following command:
# cd $DATADIR && curl -L -O http://downloads.yeastgenome.org/sequence/S288C_reference/orf_protein/orf_trans.fasta.gz && gunzip orf_trans.fasta.gz

export DATADIR=/projects/w10001/singularity-workshop

# Pull the container to a temporary directory
export SINGULARITY_PULLFOLDER=$TMPDIR
singularity pull --name blast.simg docker://biocontainers/blast:2.2.31

# cd to the directory from where this job was submitted (where we want to write the output)
cd $PBS_O_WORKDIR

singularity exec -B $DATADIR:/data $TMPDIR/blast.simg makeblastdb -in /data/orf_trans.fasta -out orf_trans -dbtype prot -title "Yeast Open Reeading Frames" -parse_seqids

singularity exec -B $DATADIR:/data $TMPDIR/blast.simg blastp -query /data/orf_trans.fasta -db orf_trans -max_target_seqs 2 -max_hsps 1 -evalue 1e-6 -outfmt '7 qseqid sseqid length qlen slen qstart qend sstart send evalue' -out yeast_blastp_yeast_top2.txt -num_threads 1
