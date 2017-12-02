-module(day02).
-export([solve1/0,
        solve2/0]). 

% read input
getInput() ->
    {ok, Bin} = file:read_file("input.txt"),
    parse(string:tokens(binary_to_list(Bin), "\r\n"), []).

parse([], Acc) -> Acc;
parse([H|T], Acc) ->
    parse(T, [[list_to_integer(X) || X <- string:tokens(H, "\t ")]|Acc]).


% first task
solve1()-> Input = getInput(),
           solve1(Input, 0).

solve1([], Acc) -> Acc;
solve1([H|T], Acc)-> solve1(T, Acc + solveline1(H)).

solveline1(Line) -> lists:max(Line) - lists:min(Line).


% second task
solve2() -> Input = getInput(),
            solve2(Input, 0).

solve2([], Acc) -> Acc;
solve2([H|T], Acc) -> solve2(T, Acc + solveline2(H)).

solveline2([H|T]) -> 
    N = round(divisible(H, T)),
    if N > 0 -> N;
       N == 0 -> solveline2([hd(T)|tl(T)])
    end.

divisible(_, []) -> 0;
divisible(N, [H|T]) ->
    if N rem H == 0 -> N/H;
       H rem N == 0 -> H/N;
       N rem H /= 0 -> divisible(N, T)
    end.
