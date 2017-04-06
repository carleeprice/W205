(ns tweetwordcount
  (:use     [streamparse.specs])
  (:gen-class))

(defn tweetwordcount [options]
   [
    ;; spout configuration
    {"tweet-spout" (python-spout-spec
          options
          "spouts.tweets.Tweets"
          ["tweet"]
          )
    }
    ;; bolt configuration
    {"parse-tweet-bolt" (python-bolt-spec
          options
          {"tweet-spout" :shuffle}
          "bolts.parse.ParseTweet"
          ["word"]
          :p 1
          )
     "count-bolt" (python-bolt-spec
          options
		  {"parse-tweet-bolt" :shuffle}
          "bolts.wordcount.WordCounter"
          ["word", "count"]
          :p 1
          )
    }
  ]
)

#Note: this complies with the wordcount example from Lab 6, NOT with the git repository version
