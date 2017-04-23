import sys

import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

def counter(word):

	conn = psycopg2.connect(database = "tcount", user = "postgres", password = "pass", host = "localhost", port = "5432")
	cur = conn.cursor()
	
	word = sys.argv[1]

	cur.execute("SELECT * FROM tweetwordcount WHERE word = %s", (word,))
	wordrow = cur.fetchall()
	if wordrow:
		wordcount = wordrow[0][1]
	else:
		wordcount = 0
	print "word=", wordrow[0][0], "count =", wordcount

			
def nocounter():

	conn = psycopg2.connect(database = "tcount", user = "postgres", password = "pass", host = "localhost", port = "5432")
	cur = conn.cursor()
	
	cur.execute("SELECT * from tweetwordcount ORDER BY count;")
	wordsrow = cur.fetchall()
	for words in wordsrow:
		print "word = ", word[0], "count =", word[1]
			
		
if __name__== "__main__":
	if len(sys.argv) > 2:
		print "only one word argument allowed"
		exit(1)
		
	elif len(sys.argv) < 2:
		nocounter()

	else:
		counter(sys.argv[1])