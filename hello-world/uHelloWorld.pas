unit uHelloWorld;

interface

  function Hello: string;

implementation

  function Hello: String;
  begin
    result := 'Hello, World!';
  end;

end.
