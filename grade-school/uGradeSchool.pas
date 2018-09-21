unit uGradeSchool;

interface

  uses
    System.Generics.Collections;

  type
    TRoster = TList<String>;

    ISchool = Interface
      procedure Add(name: String; grade: Integer);
      function Roster: TRoster;
      function grade(grade: Integer): TRoster;
    End;

  function NewSchool: ISchool;

implementation

  type
    TSchool = class(TInterfacedObject, ISchool)
    private
      studentsInGrades: TDictionary<Integer, TRoster>;
    public
      constructor Create;
      destructor Destroy;
      procedure Add(name: String; grade: Integer);
      function Roster: TRoster;
      function grade(grade: Integer): TRoster;
    end;

  constructor TSchool.Create;
  begin
    studentsInGrades := TDictionary<Integer, TRoster>.Create;
  end;

  destructor TSchool.Destroy;
  var
    g: TPair<Integer, TRoster>;
  begin
    if studentsInGrades.Count > 0 then
    begin
      for g in studentsInGrades do
      begin
        g.Value.Clear;
        g.Value.DisposeOf;
      end;
      studentsInGrades.DisposeOf;
    end;
  end;

  function NewSchool: ISchool;
  begin
    result := TSchool.Create;
  end;

  procedure TSchool.Add(name: String; grade: Integer);
  var
    someGrade: TRoster;
  begin
    if studentsInGrades.ContainsKey(grade) then
    begin
      someGrade := studentsInGrades.Items[grade];
      someGrade.Add(name);
    end
    else
    begin
      someGrade := TRoster.Create;
      studentsInGrades.Add(grade, someGrade);
      someGrade.Add(name);
    end;
  end;

  function TSchool.grade(grade: Integer): TRoster;
  var
    Roster: TRoster;
  begin
    if studentsInGrades.ContainsKey(grade) then
    begin
      Roster := studentsInGrades.Items[grade];
      Roster.Sort;
      result := Roster;
    end
    else
      result := TRoster.Create;
  end;

  function TSchool.Roster: TRoster;
  var
    i: Integer;
    arr: TArray<Integer>;
  begin
    result := TRoster.Create;
    arr := studentsInGrades.Keys.ToArray;
    TArray.Sort<Integer>(arr);
    for i in arr do
      result.AddRange(grade(i).ToArray);
  end;

end.
