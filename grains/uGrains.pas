unit uGrains;

interface

uses
  SysUtils;

type
  Grains = class
    class function Square(square : Integer) : UInt64;
    class function Total : UInt64;
  end;

implementation

  class function Grains.Square(square: Integer) : UInt64;
  var i : Integer;
  begin
    if (square > 64) or (square < 1) then
      raise ERangeError.Create('Number outside permitted range..');
    result := 1;
    for i := 2 to square do
    begin
      result := result + result;
    end;
  end;

  class function Grains.Total : UInt64;
  begin
    result := (Square(64) * 2) - 1;
  end;


end.
