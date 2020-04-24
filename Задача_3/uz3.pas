unit Uz3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus
  ,Unit_z3;

type

  { TForm_Cube }

  TForm_Cube = class(TForm)
    Rs_button: TButton;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    Menu_Exit: TMenuItem;
    Menu_Spravka: TMenuItem;
    Menu_OpenFile: TMenuItem;
    Save_file: TMenuItem;
    Menu_SaveResult: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    edit_side: TEdit;
    Label1: TLabel;
    Memo1: TMemo;
    procedure Menu_SaveResultClick(Sender: TObject);
    procedure Rs_buttonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure Menu_ExitClick(Sender: TObject);
    procedure Menu_OpenFileClick(Sender: TObject);
    procedure Menu_SpravkaClick(Sender: TObject);
    procedure DataFromForm();
    procedure Save_fileClick(Sender: TObject);
  private

  public

  end;

var
  Form_Cube: TForm_Cube;
  S,V,a:real;
  flag:boolean;

implementation

{$R *.lfm}

{ TForm_Cube }

procedure TForm_Cube.MenuItem1Click(Sender: TObject);
begin

end;

procedure TForm_Cube.Menu_ExitClick(Sender: TObject);
begin
  if messagedlg('Выход','Вы точно хотите выйти?',mtConfirmation,
                [mbYes,mbNo],0) = mrYes then
    Close;
end;

procedure TForm_Cube.Menu_OpenFileClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    begin
      if OpenDialog1.FileName <> '' then
        begin
          read_params(a,OpenDialog1.FileName);
          Edit_Side.Text:=floattostr(a);
        end;
    end;
end;

procedure TForm_Cube.Menu_SpravkaClick(Sender: TObject);
begin
  showmessage('Студент Группы ИВТ-19-1 Будников Даниил, задача №3, Дана длина ребра куба. Найти объём куба и площадь его боковой поверхности ; http://чибгу.рф/zadachnik/Glava01/index01.htm#z3');
end;

procedure TForm_Cube.Rs_buttonClick(Sender: TObject);//Вычисление объёма и площади
begin
  DataFromForm();
  if flag=true then
    begin
      a:= strtofloat(edit_side.Text);
      calc_sv(a,s,v);
      Memo1.Append('При стороне куба : '+floattostr(a));
      Memo1.Lines.Add('  Объём куба равен : '+floattostr(V));
      Memo1.Lines.Add('  Площадь боковой поверхности : '+floattostr(S));
    end
  else
    begin
      flag:=true;
      exit;
    end;
end;


//
procedure TForm_Cube.Menu_SaveResultClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
    if SaveDialog1.FileName <> '' then
      Memo1.Lines.SaveToFile(SaveDialog1.FileName)
end;


//
procedure TForm_Cube.FormCreate(Sender: TObject);
begin
  flag:=true;
end;



//
procedure  TForm_Cube.DataFromForm();   //определение метода класса.
begin
  if ((TryStrToFloat(Edit_side.Text,a))= false) or ((strtofloat(edit_side.Text)<0))then
    begin
      ShowMessage('Неправильно введена сторона куба');
      flag:=false;
      exit;
    end;
end;

procedure TForm_Cube.Save_fileClick(Sender: TObject);
var f:text;
begin
  DataFromForm();
  if flag=true then
    begin
  if SaveDialog1.Execute then
    if SaveDialog1.FileName <> '' then
      begin
        save_params(a, SaveDialog1.FileName);
      end;
    end
  else
    begin
      flag:=true;
      exit;
    end;
end;

end.

