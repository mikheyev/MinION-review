# Evaluating the performace of Oxford Nanopore's MinION

## Data

The contents of the data folder will eventually be found on the [Dryad Digital Repository](http://dx.doi.org/10.5061/dryad.5p0c3) as doi:10.5061/dryad.5p0c3

For review, data the compressed data folder is located located [here](https://dl.dropboxusercontent.com/u/5275622/minion_data.tar.gz). This is a rather large file (32G compressed), with the following contents: 

	896K   data/processed		# derived data files, mainly read lengths and BLASt vs nr summaries
	45G    data/lambda			# files associated with the lambda phage genome
	72M    data/lambda/align	# aligned reads for lambda phage
	44G    data/lambda/reads	# basecalled data from MinION (*.fast5) and fastq files
	279M   data/lambda/blast	# blast vs NCBI nr .xml results
	2.7G   data/snake			# files associated with the *Protobothrops flavoviridis* venom gland transcriptome
	1.9G   data/snake/illumina	# trimmed GAII reads from Aird et al. (2013)
	759M   data/snake/raw		# basecalled data from MinION (*.fast5) and fastq files
	37M    data/snake/blast		# blast vs NCBI nr .xml results
	27M    data/snake/aligned 	# aligned reads for snake transcriptome

Unless you are interested in the very low-level data, you can probably exclude `data/*/*/*.fast5*` and `data/snake/illumina`, which take up almost all the space in the archive:

	tar --exclude=*.fast5* --exclude=illumina -tzf minion_data.tar.gz

You can check if the compressed data file has been trasferred correctly by obtaining the [MD5 checksum](https://dl.dropboxusercontent.com/u/5275622/minion_data.tar.gz.md5).

## Analysis folder (src)

All of the analysis scripts in this folder were written to run on OIST's tombo cluster and may require some modification in order to work on a standalone computer.
