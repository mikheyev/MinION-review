import glob,pdb
from Bio.Blast import NCBIXML

print "Query Name\tSubject Name"

count =0
for f in glob.glob("../data/lambda/blast/*xml"):
	f_handle = open(f)
	# blast_records = NCBIXML.parse(f_handle)
	# if blast_records:
	for rec in NCBIXML.parse(f_handle):
		if rec.alignments:
			hsp = rec.alignments[0].hsps[0]
			print "\t".join(map(str,[rec.query,rec.alignments[0].title]))
	f_handle.close()
