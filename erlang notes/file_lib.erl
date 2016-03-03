%  写入文件

-module(file_lib).
-export([unconsule/2]).

unconsule(File, L) ->
	{ok,S}  = file:open(File,write),
	lists:foreach(fun
		(X) ->
			io:format(S,"~p.~n",[X])
	end,L),
	file:close(S).

	