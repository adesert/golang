
%% 消息的发送和接收

-module(area_server).
-export([start/0,area/2]).

start() -> spawn(fun loop/0).

area(Pid,What) -> rpc(Pid,What).

rpc(Pid,Request) ->
	Pid ! {self(),Request},
	receive
		{Pid,Response} ->
			Response
	end.

loop() -> 
	receive
		{From,{rectangle,Width,Ht}} -> From ! {self(),Width*Ht},loop();
		{From,{circle,R}} -> From ! {self(),3.1415*R*R},loop();
		{From,Other} -> From ! {self(),{error,Other}},loop()
	end.



% 2> c(area_server).
% {ok,area_server}
% 3> Pid = area_server:start().
% <0.44.0>
% 4> area_server:area(Pid,{rectangle,10,8}).
% 80
% 5>
