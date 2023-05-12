#!/usr/bin/env python3
import tweepy

# enter your Twitter API credentials
consumer_key = 'your_consumer_key'
consumer_secret = 'your_consumer_secret'
access_token = 'your_access_token'
access_token_secret = 'your_access_token_secret'

# authenticate with Twitter API
auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)
api = tweepy.API(auth)

# search for tweets with hashtag
hashtag = input('Enter hashtag to search: ')
tweets = api.search(q=hashtag)

# follow users who posted the tweets
for tweet in tweets:
    user = tweet.user
    try:
        api.create_friendship(user.id)
        print('Followed @' + user.screen_name)
    except tweepy.TweepError as e:
        print(e)
