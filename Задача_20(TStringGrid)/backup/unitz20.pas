unit UnitZ20;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type ft= file of text;
var t:ft;

//Процедура вычисления арифм. прогрессии
function calc_progression(var a,d:real;n:integer):real;

//Процедура чтения параметров из файла
procedure  read_params(var a,d:real;n:integer;Filename:string);

//Процедура сохранения параметров в файл
procedure save_params(a,d:string;n:integer;Filename:string);


implementation

//
procedure  read_params(var a,d:real;n:integer;Filename:string);
var f:text;
    s:string;
begin
  assign(f, filename);
  reset(f);
  readln(f,s);
  a:=strtofloat(s);
  readln(f,s);
  d:=strtofloat(s);
  readln(f,s);
  n:=strtoint(s);
  close(f);
end;

//
procedure save_params(a,d:string;n:integer;Filename:string);
var f:text;
begin
  assign(f, filename);
  rewrite(f);
  writeln(f,a);
  writeln(f,d);
  writeln(f,n);
  close(f);
end;

//
function calc_progression(var a,d:real;n:integer):real;
begin
  result:=((2*a+d*(n-1))/2)*n
end;

end.

