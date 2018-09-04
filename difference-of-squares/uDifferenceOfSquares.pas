unit uDifferenceOfSquares;

interface

  function squareOfSum(maxNum: Integer): Integer;
  function sumOfSquares(maxNum: Integer): Integer;
  function differenceOfSquares(maxNum: Integer): Integer;

implementation

  function squareOfSum(maxNum: Integer): Integer;
  var sum, n: Integer;
  begin
    sum := 0;
    for n := 1 to maxNum do
      sum := sum + n;
    result := sum * sum;
  end;

  function sumOfSquares(maxNum: Integer): Integer;
  var i, n: Integer;
  begin
    result := 0;
    for n := 1 to maxNum do
      result := result + (n*n);
  end;

  function differenceOfSquares(maxNum: Integer): Integer;
  begin
    result := squareOfSum(maxNum) - sumOfSquares(maxNum);
  end;

end.
