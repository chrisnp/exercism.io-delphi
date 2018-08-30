unit uRaindrops;

interface

type

  Raindrops = class
    class function Convert (num : Integer) : String ;
  end;

implementation
  uses System.SysUtils;

  class function Raindrops.Convert (num : Integer) : String ;
  begin
    result := '';
    if num mod 3 = 0 then result := result + 'Pling';
    if num mod 5 = 0 then result := result + 'Plang';
    if num mod 7 = 0 then result := result + 'Plong';
    if  result = ''  then result := num.ToString();
  end;

end.
