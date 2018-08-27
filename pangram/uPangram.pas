unit uPangram;

interface

//uses System.Generics.Collections;
type
  TLetters = set of char;

function isPangram(words: string): Boolean;

implementation

uses SysUtils;

function isPangram(words: string): Boolean;
var
//  Letters: TList<char>;
  Letters : TLetters;
  ch: char;
  i: Integer;
begin
  result := false;
  Letters := TLetters;
  Letters := [];
  // SetLength(Letters, words.Length);
  for ch in words.ToLowerInvariant do
    if (ch in ['a' .. 'z']) then
      if (not (ch in Letters)) then
      begin
        Letters.;
      end;
  result := Length(Letters) = 26;
end;

end.
