unit uNucleotideCount;

interface

uses
  SysUtils, System.Generics.Collections;

type
  EInvalidNucleotideException = Exception;
  TDNA = class
  private
      strand : String;
      nDictionary : TDictionary<Char,Integer>;
  public
      constructor Create(s : String);
      destructor  Destroy;
      function NucleotideCounts : TDictionary<Char,Integer>;
      function Count(nucleotide : Char) : Integer;
  end;

implementation

  constructor TDNA.Create(s: string);
  var
    nuc : Char;
  begin
    strand := s;
    nDictionary := TDictionary<Char,Integer>.Create;
    nDictionary.Add('C',0);
    nDictionary.Add('G',0);
    nDictionary.Add('A',0);
    nDictionary.Add('T',0);

    for nuc in strand do
    begin
      if not nDictionary.ContainsKey(nuc) then
        raise EInvalidNucleotideException.Create('Invalid nucleotide in strand');
      nDictionary.Items[nuc] := nDictionary.Items[nuc] + 1
    end;

  end;

  destructor TDNA.Destroy;
  begin
    nDictionary.Free;
  end;

  function TDNA.Count(nucleotide : Char) : Integer;
  begin
    result := nDictionary.Items[nucleotide];
  end;

  function TDNA.NucleotideCounts : TDictionary<Char,Integer>;
  begin
    result := nDictionary;
  end;

end.

