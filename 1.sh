curl -XPUT 'http://localhost:9200/twitter' -d '{
    "settings" : {
        "index" : {
            "number_of_shards" : 1,
            "number_of_replicas" : 1
        },  
        "analysis" : {
            "filter" : {
                "tweet_filter" : {
                    "type" : "word_delimiter",
                    "type_table": ["# => ALPHA", "@ => ALPHA"]
                }   
            },
            "analyzer" : {
                "tweet_analyzer" : {
                    "type" : "custom",
                    "tokenizer" : "whitespace",
                    "filter" : ["lowercase", "tweet_filter"]
                }
            }
        }
    },
    "mappings" : {
        "tweet" : {
            "properties" : {
                "msg" : {
                    "type" : "string",
                    "analyzer" : "tweet_analyzer"
                }
            }
        }
    }
}'
