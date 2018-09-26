unit uCollatzconjecture;

interface
uses SysUtils;

type
  EIllegalNumber = class(Exception);

  function collatzSteps(number: integer): integer;

implementation

function collatzSteps(number: integer): integer;
  function collatz(number: integer): integer;
  begin
    if not odd(number) then
      result := number div 2
    else
      result := (number * 3) + 1;
  end;
begin
  if number <= 0 then
    raise EIllegalNumber.Create('error: Only positive numbers are allowed');
  result := 0;
  while (number > 1) and (result < 1000) do
  begin
    number := collatz(number);
    inc(result);
  end;
end;

end.
