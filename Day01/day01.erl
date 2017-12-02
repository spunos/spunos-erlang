-module(day01).
-export([day01/0]).

day01() -> {ok, Input} = file:read_file("input.txt"),
           List = hd(parse(Input)),

           % first task
           erlang:display(solve(0, List ++ [hd(List)])), 

           % second task
           {L1, L2} = lists:split(length(List) div 2, List),
           solve(0, L1, L2).

parse(Bin) -> string:tokens(binary_to_list(Bin), "\r\n").

solve(N, [H|[H|T]]) -> solve(N + H - 48, [H|T]);
solve(N, [_|[H|T]]) -> solve(N, [H|T]);
solve(N, [_]) -> N.

solve(N, [H|T], [H|Ts]) -> solve(N + (H - 48) * 2, T, Ts);
solve(N, [_|T], [_|Ts]) -> solve(N, T, Ts);
solve(N, _, _) -> N.
