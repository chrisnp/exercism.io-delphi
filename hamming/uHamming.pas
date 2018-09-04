unit uHamming;

interface

  type
    THamming = class
        class function Distance(strand1, strand2 : String) : integer;
    end;

implementation
  uses System.SysUtils;

  class function THamming.Distance(strand1, strand2 : String) : integer;
  var
    i : integer;
  begin
    if strand1.Length <> strand2.Length  then
      raise EArgumentException.Create('error: left and right strands must be of equal length');
    result := 0;
    for i := Low(strand1) to High(strand1) do
      if strand1[i] <> strand2[i] then
        result := result + 1;
  end;

end.
