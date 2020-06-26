unit Unit_z3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,Uz3;

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
  writeln(f,a);
  close(f);
end;

procedure save_result(Filename:string);
var f:text;
  i:integer;
begin
  i:=1;
  assign(f,filename);
  append(f);
  while Table.cells[0,i]<>'' do
    begin
      writeln(f,'№ '+form_cube.Table.cells[0,i]);
      writeln(f,'Сторона куба: '+form_cube.Table.cells[1,i]);
      writeln(f,'Площадь куба: '+form_cube.Table.cells[2,i]);
      writeln(f,'Объём куба: '+form_cube.Table.cells[3,i]);
      writeln(f);
    end;
  writeln(f,'-----------------------'+#13);
end;

end.

