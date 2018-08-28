unit uPangram;

interface

uses System.Generics.Collections;
type
  TLetters = set of Char;

function isPangram(words: string): Boolean;

implementation

uses SysUtils;

function isPangram(words: string): Boolean;
var
  Letters : TLetters;
  ch: char;
begin
  result := false;
  Letters := [];

  for ch in words.ToLowerInvariant do
    if (CharInSet(ch, ['a'..'z']) and (not CharInSet(ch, Letters))) then
        Letters := [ch];
    result := ['a'..'z'] = Letters;
end;

end.
