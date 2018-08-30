unit uDifferenceOfSquares;

interface

  function squareOfSum(maxNum: Integer): Integer;
  function sumOfSquares(maxNum: Integer): Integer;
  function differenceOfSquares(maxNum: Integer): Integer;

implementation
  uses System.Generics.Collections;

  function squareOfSum(maxNum: Integer): Integer;
  var numbers: TList<Integer>;
      sum, i, n: Integer;
  begin
    numbers := TList<integer>.Create;
    for i := 1 to maxNum do
      numbers.Add(i);
    sum := 0;
    for n in numbers do
      sum := sum + n;
    result := sum * sum;
  end;

  function sumOfSquares(maxNum: Integer): Integer;
  var squares: TList<Integer>;
      i, n: Integer;
  begin
    squares := TList<Integer>.Create;
    for i := 1 to maxNum do
    begin
      squares.Add(i * i);
    end;
    result := 0;
    for n in squares do
      result := result + n;
  end;

  function differenceOfSquares(maxNum: Integer): Integer;
  begin
    result := squareOfSum(maxNum) - sumOfSquares(maxNum);
  end;

end.
