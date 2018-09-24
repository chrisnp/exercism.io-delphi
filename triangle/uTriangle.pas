unit uTriangle;

interface

type
  TriangleKind = (Equilateral, Isosceles, Scalene);
  Triangle = class
    class function Sides(kind : TriangleKind; a, b, c : double) : boolean;
  end;

implementation

function IsTriangle(a, b, c : double) : boolean;
var 
  positiveSides, triangleInequality, degenerate : Boolean;
begin
  positiveSides := (a > 0) and (b > 0) and (c > 0);
  triangleInequality := ((a <= b + c) and (b <= a + c) and (c <= a + b));
  degenerate := (((a + b) = c) or ((a + c) = b) or ((c + b) = a));
  result := positiveSides and not degenerate and triangleInequality;
end;

class function Triangle.Sides(kind : TriangleKind; a, b, c: double) : boolean;
begin
  result := false;
  if IsTriangle(a, b, c) then
    case kind of
        Equilateral: result := (a = b) and (b = c);
        Isosceles: result := (a = b) or (b = c) or (a = c);
        Scalene: result := (a <> b) and (a <> c) and (b <> c);
    end;
  
end;
end.
