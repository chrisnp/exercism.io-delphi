unit uIsogram;

interface

  function isIsogram(word : String) : Boolean;

implementation
  uses System.SysUtils;

  function isIsogram(word : String) : Boolean;
  var
    Letters : String;
    ch : Char;
    normal: String;
  begin
    Letters := '';
    normal := word.ToLowerInvariant.Replace('-','').Replace(' ','');
    for ch in normal do
    begin
      if (Letters.contains(ch)) then
        exit(false)
      else
        Letters := Letters + ch;
    end;
    result := True;
  end;
end.
