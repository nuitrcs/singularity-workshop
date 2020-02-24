#!/bin/bash

#SBATCH -A w10001
#SBATCH -p w10001
#SBATCH -t 00:30:00
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --mem=4G

# BEFORE RUNNING THIS SCRIPT, make sure that the orf_trans.fasta file is accessible in your $DATADIR folder
# e.g. by running the following command:
# cd $DATADIR && curl -L -O http://downloads.yeastgenome.org/sequence/S288C_reference/orf_protein/orf_trans.fasta.gz && gunzip orf_trans.fasta.gz

module load singularity

export DATADIR=/projects/w10001/data
export OUTPUTDIR=$HOME/output

mkdir -p $OUTPUTDIR

# Pull the container to a temporary directory
singularity pull blast.sif docker://biocontainers/blast:2.2.31

# cd to the directory from where this job was submitted (where we want to write the output)
singularity exec -B $DATADIR:/data,$OUTPUTDIR:/output blast.sif makeblastdb -in /data/orf_trans.fasta -out /output/orf_trans -dbtype prot -title "Yeast Open Reeading Frames" -parse_seqids

singularity exec -B $DATADIR:/dataOUTPUTDIR:/output blast.sif blastp -query /data/orf_trans.fasta -db /output/orf_trans -max_target_seqs 2 -max_hsps 1 -evalue 1e-6 -outfmt '7 qseqid sseqid length qlen slen qstart qend sstart send evalue' -out /output/yeast_blastp_yeast_top2.txt -num_threads 1
