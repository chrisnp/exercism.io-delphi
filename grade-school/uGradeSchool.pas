unit uGradeSchool;

interface

uses
  System.Generics.Collections;

type
  TRoster = TList<String>;
  ISchool = Interface
    procedure Add(name : String; grade : Integer);
    function Roster : TRoster;
    function Grade(grade : Integer) : TRoster;
  End;
  function School : ISchool;

implementation

  type
    TSchool = class(TInterfacedObject, ISchool)
    private
      studentsInGrades : TDictionary<Integer, TRoster>;
    public
      constructor Create;
//      destructor Destroy;
      procedure Add(name : String; grade : Integer);
      function Roster : TRoster;
      function Grade(grade : Integer) : TRoster;
    end;

  function School : ISchool;
  begin
    result := TSchool.Create;
  end;

  constructor TSchool.Create;
  begin
    studentsInGrades := TDictionary<Integer,TRoster>.Create;
  end;

  procedure TSchool.Add(name : String; grade : Integer);
  var
    new : TRoster;
  begin
    if (studentsInGrades.ContainsKey(grade)) then
      studentsInGrades.Items[grade].Add(name)
    else
    begin
      new := TRoster.Create;
      studentsInGrades.Add(grade, new);
      new.Add(name);
    end;
  end;

  function TSchool.Grade(grade: Integer) : TRoster;
  var
    r : TRoster;
  begin
    if studentsInGrades.ContainsKey(grade) then
    begin
      r := studentsInGrades.Items[grade];
      r.Sort;
      result := r;
    end
    else
      result := TRoster.Create;

  end;

  function TSchool.Roster: TRoster;
  var
    grade: TPair<integer, TRoster>;
    roster: TRoster;
    index: integer;
  begin
    result := TRoster.Create;
    for index := Low to High do

    for index := fLowGrade to fHighGrade do
      if fRoster.TryGetValue(idxGrade, lRoster) then
        result.AddRange(lRoster.ToArray);
  end;

end.
