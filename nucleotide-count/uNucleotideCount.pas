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
  begin
    strand := s;
    nDictionary := TDictionary<Char,Integer>.Create;
    nDictionary.Add('C',0);
    nDictionary.Add('G',0);
    nDictionary.Add('A',0);
    nDictionary.Add('T',0);
  end;

  destructor TDNA.Destroy;
  begin
    nDictionary.Free;
  end;

  function TDNA.Count(nucleotide : Char) : Integer;
  begin
    try
      result := nDictionary.Items[nucleotide];
    except
      raise EInvalidNucleotideException.Create('Invalid nucleotide in strand');
    end;
  end;

  function TDNA.NucleotideCounts : TDictionary<Char,Integer>;
  var nuc : Char;
  begin
    for nuc in strand do
    begin
      if nDictionary.ContainsKey(nuc) then
        nDictionary.Items[nuc] := nDictionary.Items[nuc] + 1;
    end;
    result := nDictionary;
  end;

end.
