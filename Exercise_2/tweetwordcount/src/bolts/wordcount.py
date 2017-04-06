from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt
import psycopg2 
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

#this code chunk comes from the wordcount.py sample provided in codebase
class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()

    def process(self, tup):
		#this collects the valid_words emitted by the parse bolt.  I wonder if they're single words what would tup.values[1] return?
        word = tup.values[0]

		conn = psycopg2.connect(database="postgres", user="postgres", password="pass", host="localhost", port="5432")
		#the following code chunk is copied directly from psycopg-sample.py
		try:
			conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
			cur = conn.cursor()
			cur.execute('''CREATE DATABASE tcount''')
			cur.close()
			conn.commit()
			conn.close()
			
		except:
			print("Could not create tcount"​)
			
		conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
		
		cur = conn.cursor()
		
		try:
			cur.execute('''CREATE TABLE tweetwordcount
				   (word TEXT PRIMARY KEY     NOT NULL,
				   count INT     NOT NULL);''')
		except:										
			print("table already exists")			
			
		conn.commit()
		conn.close()
		
		#this is based on counter code that works well in python.  have not been able to test it as part of this script as it failes much earlier
		
		conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
		cur = conn.cursor()

		cur.execute('''SELECT * FROM tweetwordcount''')
		rows = cur.fetchall()
		for row in rows:
			if row[0] == word:
				newcount = row[1] + 1
				cur.execute('''UPDATE tweetwordcount SET count=%s WHERE word='%s';''', (word, newcount))
				#added this in response to a duplicate key error. it doesn't work.
				conn.commit()
			else:
				cur.execute('''INSERT INTO tweetwordcount (word,count)
				VALUES ('%s', %d);''', (word, 1))
				conn.commit()
				
		conn.commit()
		conn.close
		
		self.emit([word, self.counts[word]])
		
