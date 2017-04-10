from sys import argv
import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

def hist(anum, bnum):

	conn = psycopg2.connect(database="tcount", user="postgres", password="password", host="localhost", port="5432")
	cur = conn.cursor()
	squery = cur.mogrify("SELECT * FROM Tweetwordcount WHERE count BETWEEN %s AND %s ORDER BY count DESC", (anum, bnum))
	cur.execute(squery)
	words = cur.fetchall()
	for word in words:
		print "word =", str(word[0]), "count =", str(word[1])

if __name__== "__main__":
	hist(int(argv[1]), int(argv[2]))