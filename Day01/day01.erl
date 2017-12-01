-module(day01).
-export([day01/0]).

day01() -> {ok, Input} = file:read_file("input.txt"),
           solve(0, hd(parse(Input)) ++ [hd(hd(parse(Input)))]).

parse(Bin) -> string:tokens(binary_to_list(Bin), "\r\n").

solve(N, [H|[H|T]]) -> solve(N + H - 48, [H|T]);
solve(N, [_|[H|T]]) -> solve(N, [H|T]);
solve(N, [_]) -> N.
