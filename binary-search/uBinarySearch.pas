unit uBinarySearch;

interface

type
  BinarySearch = class
    class function Search(inputList : TArray<Integer>;
                          value : Integer ) : Integer;
    end;

implementation

class function BinarySearch.Search(inputList : TArray<Integer>;
                                   value : Integer ) : Integer;

  function RecSearch(inputList : TArray<Integer>;
                     val, loIdx, hiIdx : Integer) : Integer;
  var
    midx : Integer;
  begin
    if hiIdx - loIdx < 0 then
      result := -1
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

begin
  result := RecSearch(inputList, value, Low(inputList), High(inputList));
end;

end.
