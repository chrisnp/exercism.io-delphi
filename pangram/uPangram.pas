unit uPangram;

interface

  function isPangram (words : string) : Boolean;

implementation

  uses System.SysUtils, System.Generics.Collections,
       System.Character;

  function isPangram (words : string) : Boolean;
  var
    Letters: TList<char>;
    ch: Char;
  begin
    result := false;
    Letters := TList<char>.Create;
    for ch in words.ToLowerInvariant do
      if (IsLetter(ch)) and (not Letters.Contains(ch)) then
        Letters.Add(ch);
    result := Letters.Count = 26;
    Letters.Free;
  end;

end.
