unit uLeap;

interface
  type
    TYear = class
      public class function IsLeap(year : Integer) : Boolean; static;
    end;

implementation

  class function TYear.IsLeap(year : Integer) : Boolean;
  begin
    result := (year mod 400 = 0)
              or ((year mod 4 = 0) and not (year mod 100 = 0));
  end;

end.
