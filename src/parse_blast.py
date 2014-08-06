from __future__ import division
from numpy import mean,std
from collections import Counter
from Bio.Blast import NCBIXML

insertions = Counter()
aligned_length = []  #length of aligned regions 
read_len = []  #list of read lengths
identities = [] #length of identical regions
for rec in NCBIXML.parse(open("../data/lambda/align/1d.xml")):   #change to '2d.xml' for 2D data parsing
	read_len.append(rec.query_length)
	aligned = 0
	identical = 0
	if rec.alignments:
		for hsp in rec.alignments[0].hsps:
			identical += hsp.identities
			aligned += hsp.align_length
			for s,q in zip(hsp.sbjct,hsp.query):
				if s == '-':
					insertions[q] += 1
	aligned_length.append(aligned)
	identities.append(identical)

print "Mapped reads %i" % len(read_len)
print "Aligned bases %i" % sum(aligned_length)
#matchesPerRead = [x/y for x, y in zip(aligned_length, read_len)]
print "Aligned bases per read %f +/- %f" % (mean(aligned_length),std(aligned_length))
print "Mapped read identity %f" % (sum(identities)/sum(read_len))
for item in insertions:
	print item, insertions[item]

