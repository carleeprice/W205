import sys

import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT



def counter(word):
	
	word = sys.argv[1]
	
	conn = psycopg2.connect(database = "tcount", user = "postgres", password = "pass", host = "localhost", port = "5432")
	curr = conn.cursor()
	if word:
		squery = cur.mogrify("SELECT count FROM tweetwordcount WHERE word ' %s", (word,))
		cur.execute(squery)
		wordrow = cur.fetchall()
		if wordrow:
			wordcount = count[0][0]
		else:
			wordcount = 0
		print "word=", wordcount[0], "count =", wordcount[1]
	else:
		squery = cur.mogrify("SELECT * from tweetwordcount ORDER BY word ASC")
		cur.execute(squery)
		wordsrow = cur.fetchall()
		for words in wordsrow:
			print "word = ", words[0], "count =", words[1]
		
	

cur.execute("UPDATE tweetwordcount SET count=count+1 WHERE word=%s", (word,))
print "number of updated rows", cur.rowcount

if cur.rowcount == 0:
	cur.execute("INSERT INTO tweetwordcount (word, count) VALUES (%s, 1)", (word,))

conn.commit()

cur.execute("SELECT word, count from tweetwordcount")
records = cur.fetchall()
for rec in records:
	print "word =", rec[0]
	print "count =", rec[1], "\n"

conn.commit()
conn.close()


if __name__== "__main__":
	if len(argv) > 2:
		print "only one word argument allowed"
		exit(1)

	else:
		counter(argv[1])
	
