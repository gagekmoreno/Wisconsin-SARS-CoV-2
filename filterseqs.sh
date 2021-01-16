## fitler sequences so that you have a fasta that has Wisconsin and AVRL sequences
augur filter --sequences data/sequences.fasta --metadata data/metadata.tsv --group-by month year division --exclude-where 'division!=Wisconsin' --output data/Wisconsin.fasta
augur filter --sequences data/sequences.fasta --metadata data/metadata.tsv --group-by month year submitting_lab --exclude-where 'submitting_lab!=University of Wisconsin-Madison AIDS Vaccine Research Laboratories' --output data/AVRL.fasta

##combine fastas to one output fasta
cat data/Wisconsin.fasta data/AVRL.fasta > data/sequences_duplicated.fasta

##dedupe the fasta 
bash dedupe.sh in=data/sequences_duplicated.fasta out=data/Wisconsin_sequences.fasta ow=t ac=f requirematchingnames

