unit uBinarySearch;

interface

type
  BinarySearch = class
 private
    class function RecSearch(inputList : TArray<Integer>;
                            val, loIdx, hiIdx : Integer) : Integer; static;
  public
    class function Search(inputList : TArray<Integer>;
                          value : Integer ) : Integer;
  end;

implementation

class function BinarySearch.RecSearch(inputList : TArray<Integer>;
                            val, loIdx, hiIdx : Integer) : Integer;
var
    midx : Integer;
begin
  if hiIdx - loIdx <= 1 then
  begin
    result := -1;
    if val = inputList[hiIdx] then result := hiIdx;
    if val = inputList[loIdx] then result := loIdx;
  end
  else
  begin
    midx := (loIdx + hiIdx) div 2;
    if (val = inputList[midx]) then
      result := midx
    else if (val < inputList[midx]) then
      result := RecSearch(inputList, val, loIdx, midx - 1)
    else
      result := RecSearch(inputList, val, midx + 1, hiIdx);
  end;
end;


class function BinarySearch.Search(inputList : TArray<Integer>;
                                   value : Integer ) : Integer;
begin
  if Length(inputList) = 0 then
    result := -1
  else
    result := RecSearch(inputList, value, Low(inputList), High(inputList));
end;

end.
