unit uIsogram;

interface

  function isIsogram(word : String) : Boolean;

implementation
  uses System.SysUtils;

  function isIsogram(word : String) : Boolean;
  var
    Letters : set of Char;
    ch : Char;
    normal: String;
  begin
    Letters := [];
    normal := word.ToLowerInvariant.Replace('-','').Replace(' ','');
    for ch in normal do
    begin
      if (ch in Letters) then
        exit(false)
      else
        Letters := Letters + [ch];
    end;
    result := True;
  end;
end.
