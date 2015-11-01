-module(java).

% application
-export([ factorial/1,factorialRecorder/2]).

factorial(Val)->
  factorial_server:factorial(Val).

factorialRecorder(Val, IoDevice)->
  factorial_server:factorial(Val,IoDevice).