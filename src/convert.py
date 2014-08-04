import h5py, sys
from glob import glob

oneD = open(sys.argv[1]+"/1d.fastq",'w')
twoD = open(sys.argv[1]+"/2d.fastq",'w')
for f in glob(sys.argv[1]+"/*.fast5"):
	twoD_datasetname = '/Analyses/Basecall_2D_000/BaseCalled_2D/Fastq'
	oneD_datasetname = '/Analyses/Basecall_2D_000/BaseCalled_template/Fastq'
	try:
		hdf = h5py.File(f, 'r')
		if twoD_datasetname in hdf:
			twoD.write(hdf[twoD_datasetname][()])
		if oneD_datasetname in hdf:
			oneD.write(hdf[oneD_datasetname][()])
		hdf.close()
	except:
		pass