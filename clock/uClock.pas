unit uClock;

interface

type
  Clock = class
    private
      fHour : Integer;
      fMinute : Integer;
    public
      constructor SetHands(pHours : Integer; pMinutes : Integer = 0);
      function Add(pMinutes : Integer) : Clock;
      function Subtract(pMinutes : Integer) : Clock;
      function Equal(pClock : Clock) : Boolean;
      function ToString : String; override;
  end;

implementation

uses
  Sysutils, System.Math;

  constructor Clock.SetHands(pHours: Integer; pMinutes: Integer = 0);
  begin
    { 1440 (= 24 * 60) is max minutes before the clock starts over}
    fHour := ((1440 + (pHours * 60 + pMinutes) mod 1440) mod 1440) div 60;
    fMinute := ((1440 +  (pHours * 60 + pMinutes) mod 1440) mod 1440) mod 60;
  end;

  function Clock.Add(pMinutes: Integer) : Clock;
  begin
    result := Clock.SetHands(fHour, fMinute + pMinutes);
  end;

  function Clock.Subtract(pMinutes: Integer) : Clock;
  begin
    result := Clock.SetHands(fHour, fMinute - pMinutes);
  end;

  function Clock.Equal(pClock: Clock) : Boolean;
  begin
    result := (fHour = pClock.fHour) and (fMinute = pClock.fMinute);
  end;

  function Clock.ToString : String;
  begin
    result := format('%.2d:%.2d', [fHour, fMinute]);
  end;

end.
