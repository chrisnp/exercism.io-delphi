unit uReverseString;

interface

  function reverse(input : String) : String;

implementation

  function reverse(input : String) : String;
  var
    c : Char;
  begin
    result := '';
    for c in input do
      result := c + result;
  end;

end.
