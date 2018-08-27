unit uBob;

interface

type
  TBob = Class
  private
    class function Silent(phrase: string): Boolean; static;
    class function Shouting(phrase: string): Boolean; static;
    class function Asking(phrase: string): Boolean; static;
    class function Forceful(phrase: string): Boolean; static;
  public
    class function Response(phrase: string): string; static;
  End;

implementation

uses System.SysUtils, RegularExpressions;

class function TBob.Silent(phrase: string): Boolean;
begin
  result := phrase.Trim = '';
end;

class function TBob.Shouting(phrase: string): Boolean;
begin
  result := TRegEx.IsMatch(phrase, '([A-Za-z])+') and (phrase = phrase.ToUpper);
end;

class function TBob.Asking(phrase: string): Boolean;
begin
  result := phrase.Trim.EndsWith('?');
end;

class function TBob.Forceful(phrase: string): Boolean;
begin
  result := Asking(phrase) and Shouting(phrase);
end;

class function TBob.Response(phrase: string): string;
begin
  if Silent(phrase)        then result := 'Fine. Be that way!'
  else if Forceful(phrase) then result := 'Calm down, I know what I''m doing!'
  else if Shouting(phrase) then result := 'Whoa, chill out!'
  else if Asking(phrase)   then result := 'Sure.'
  else                          result := 'Whatever.';
end;

end.
