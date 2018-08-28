unit uPangram;

interface

  type
    TLetters = set of Char;

  function isPangram (words : string) : Boolean;


implementation

  uses SysUtils;

  function isPangram (words : string) : Boolean;
  var
    Letters: TLetters;
    ch: Char;
  begin
    result := false;
    Letters := [];
    for ch in words.ToLower do
      if (ch in ['a'..'z']) then
        if (not (ch in Letters)) then
          Letters := Letters + [ch];
    result := ['a'..'z'] = Letters;
  end;

end.
