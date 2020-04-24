unit Unit_z3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type ft= file of text;
var t:ft;

//
procedure calc_SV(var a,S,V:real);

//
procedure  read_params(var a:real;Filename:string);

//
procedure save_params(var a:real;Filename:string);



implementation



//
procedure  read_params(var a:real;Filename:string);
var f:text;
begin
  assign(f, filename);
  reset(f);
  readln(f,a);
  close(f);
end;


//
procedure calc_SV(var a,S,V:real);
begin
  S:= 4*a*a;
  V:= a*a*a;
end;

//
procedure save_params(var a:real;Filename:string);
var f:text;
begin
  assign(f, filename);
  rewrite(f);
  writeln(f,round(a));
  close(f);
end;

end.

