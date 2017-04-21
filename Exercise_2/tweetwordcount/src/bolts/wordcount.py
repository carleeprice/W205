from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt
import psycopg2 
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()
		self.conn = psycopg2.connect(database="postgres", user="postgres", password="pass", host="localhost", port="5432")

    def process(self, tup):

        word = tup.values[0]

		self.conn = psycopg2.connect(database = "tcount", user = "postgres", password = "pass", host = "localhost", port = "5432")
		cur = self.conn.cursor()
		cur.execute("SELECT word FROM tweetwordcount")
        cur.fetchall()

		if cur.rowcount == 0:
			squery = cur.mogrify("INSERT INTO tweetwordcount (word, count) VALUES (%s, 1)", (word,))
			cur.execute(squery)
		
		else:
			squery = cur.mogrify("UPDATE tweetwordcount SET count=count+1 WHERE word=%s", (word,))
			cur.execute(squery)
			

		self.conn.commit()
			
		self.counts[word] += 1	
		self.emit([word, self.counts[word]])
		
		self.log('%s, %d' % (word, self,counts[word])

		

		

		
