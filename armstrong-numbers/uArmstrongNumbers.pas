unit uArmstrongNumbers;

interface

  function isArmstrongNumber(number : Integer) : Boolean;

implementation

  uses
    SysUtils, System.Math;

  function isArmstrongNumber(number : Integer) : Boolean;
  var
    sum : Extended;
    dig : String;
  begin
    sum := 0;
    for dig in number.ToString do
      sum := sum + int(Power(dig.ToInteger, number.ToString.Length));
    result := int(sum) = number;
  end;
end.
