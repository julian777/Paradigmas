%%%-------------------------------------------------------------------
%%% @author mario
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. Oct 2015 12:39 AM
%%%-------------------------------------------------------------------
-module(db).
-author("mario").

-include("data.hrl").
-include_lib("stdlib/include/qlc.hrl").

%% API

-export([crear/0]).
-export([select_feed/0]).
-export([clean_feed/1]).
-export([insert_feed/1]).
-export([select_final/0]).
-export([clean_final/1]).
-export([insert_final/1])



crear() ->
	mnesia:create_table(feed,[{attributes, record_info(fields, feed)}]),
	mnesia:create_table(final,[{attributes, record_info(fields, final)}]).

select_feed()->
					F = fun() ->
									qlc:eval(qlc:q([X||X<-mnesia:table(feed)]))
							end,
					mnesia:transaction(F).

clean_feed(L) ->
					[mnesia:delete(feed, key, sticky_write) || {key,_,_,_,_,_,_,_} <- L].

insert_feed({Text,Date,Time,Place,Hashtag,User,Source}) ->
  Key = mnesia:dirty_update_counter(feed, record_type, 1),
	F = fun()->
			mnesia:write(
					#feed{
						key = Key,
						text = Text,
						date = Date,
            time = Time,
						place = Place,
						hashtag = Hashtag,
						user = User,
						source = Source
						})
      end,
	mnesia:transaction(F).


select_final()->
	F = fun() ->
		qlc:eval(qlc:q([X||X<-mnesia:table(final)]))
	end,
	mnesia:transaction(F).

clean_final(L) ->
	[mnesia:delete(final, key, sticky_write) || {key,_,_,_,_,_,_,_} <- L].

insert_final({Subject,Date,Time,Place,Hashtag,User,Source}) ->
	Key = mnesia:dirty_update_counter(feed, record_type, 1),
	F = fun()->
		mnesia:write(
			#final{
				key = Key,
				subject = Subject,
				date = Date,
				time = Time,
				place = Place,
				hashtag = Hashtag,
				user = User,
				source = Source
			})
	end,
	mnesia:transaction(F).
