%%%-------------------------------------------------------------------
%%% @author mario
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. Oct 2015 12:27 AM
%%%-------------------------------------------------------------------
-author("mario").


-record(feed,{key,text,time,place,user,source}).

-record(hashtag,{key,text}).

-record(feed_ht,{feed,ht}).
