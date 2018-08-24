unit uReverseString;

interface

  function reverse(input : String) : String;

implementation

  function reverse(input : String) : String;
  var
    i : integer;
  begin
    result := '';
    for i := Low(input) to High(input) do
      result := input[i] + result;
  end;

end.
