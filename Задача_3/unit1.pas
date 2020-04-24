unit Unit1;

{$mode objfpc}{$H+}

interface

{uses
  Classes, SysUtils;}

procedure calc_SV(var a,S,V:real);

implementation

procedure calc_SV(var a,S,V:real);
begin
  S:= 4*a*a;
  V:= a*a*a;
end;

end.

