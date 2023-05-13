use master;
drop database if exists x_invalid_tweets;
create database x_invalid_tweets;
go
use x_invalid_tweets;
go

create table Tweets (
  tweet_id int,
  content varchar(50),
  primary key(tweet_id)
);

insert into Tweets 
(tweet_id, content) values
(1, 'Vote for Biden'),
(2, 'Let us make America great again!');

-- invalid tweet of the number of characters used in the content of the tweet is strictly greater than 15

-- tweet_id
-- 2

-- solution 1
select tweet_id
from Tweets 
where len(content) > 15
;
