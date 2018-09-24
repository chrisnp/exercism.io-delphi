unit uSpaceAge;

interface

type
  ISpaceAge = interface
    function OnMercury: double;
    function OnVenus: double;
    function OnEarth: double;
    function OnMars: double;
    function OnJupiter: double;
    function OnSaturn: double;
    function OnUranus: double;
    function OnNeptune: double;
  end;

function NewSpaceAge(seconds: Int64): ISpaceAge;

implementation

uses System.Math;

const
  EARTH_SECONDS = 31557600;
  EARTH = 1.0;
  MERCURY = 0.2408467;
  VENUS = 0.61519726;
  MARS = 1.8808158;
  JUPITER = 11.862615;
  SATURN = 29.447498;
  URANUS = 84.016846;
  NEPTUNE = 164.79132;

type
  TSpaceAge = class(TInterfacedObject, ISpaceAge)
  private
    fSeconds: Int64;
    function OnPlanet(orbitalPeriod: double): double;
  public
    function OnMercury: double;
    function OnVenus: double;
    function OnEarth: double;
    function OnMars: double;
    function OnJupiter: double;
    function OnSaturn: double;
    function OnUranus: double;
    function OnNeptune: double;
    constructor Create(seconds: Int64);
  end;

constructor TSpaceAge.Create(seconds: Int64);
begin
  fSeconds := seconds;
end;

function TSpaceAge.OnPlanet(orbitalPeriod: double): double;
begin
  result := RoundTo((fSeconds / EARTH_SECONDS) / orbitalPeriod, -2)
end;

function TSpaceAge.OnMercury: double;
begin
  result := OnPlanet(MERCURY);
end;

function TSpaceAge.OnVenus: double;
begin
  result := OnPlanet(VENUS);
end;

function TSpaceAge.OnEarth: double;
begin
  result := OnPlanet(EARTH);
end;

function TSpaceAge.OnMars: double;
begin
  result := OnPlanet(MARS);
end;

function TSpaceAge.OnJupiter: double;
begin
  result := OnPlanet(JUPITER);
end;

function TSpaceAge.OnSaturn: double;
begin
  result := OnPlanet(SATURN);
end;

function TSpaceAge.OnUranus: double;
begin
  result := OnPlanet(URANUS);
end;

function TSpaceAge.OnNeptune: double;
begin
  result := OnPlanet(NEPTUNE);
end;

function NewSpaceAge(seconds: Int64): ISpaceAge;
begin
  result := TSpaceAge.Create(seconds);
end;

end.
