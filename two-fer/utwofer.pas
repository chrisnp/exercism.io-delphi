unit utwofer;

interface

  function twoFer(name : String = 'you') : String;

implementation

  function twoFer(name : String = 'you') : String;
  begin
    result := 'One for ' + name + ', one for me.';
  end;

end.
