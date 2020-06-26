unit Uz20;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  UnitZ20;

type

  { TForm_Progression }

  TForm_Progression = class(TForm)
    Rs_button: TButton;
    Edit_a: TEdit;
    Edit_d: TEdit;
    Edit_n: TEdit;
    Label_a: TLabel;
    Label_d: TLabel;
    Label_n: TLabel;
    Label_result: TLabel;
    MainMenu1: TMainMenu;
    Memo_Result: TMemo;
    Menu_exit: TMenuItem;
    Menu_Spravka: TMenuItem;
    Menu_SaveResult: TMenuItem;
    Menu_FileSave: TMenuItem;
    Menu_OpenFile: TMenuItem;
    Menu_File: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;

    procedure Edit_aKeyPress(Sender: TObject; var Key: char);
    procedure Edit_dKeyPress(Sender: TObject; var Key: char);
    procedure Edit_nKeyPress(Sender: TObject; var Key: char);
    procedure FormCreate(Sender: TObject);
    procedure Menu_exitClick(Sender: TObject);
    procedure Menu_FileSaveClick(Sender: TObject);
    procedure Menu_OpenFileClick(Sender: TObject);
    procedure Menu_SaveResultClick(Sender: TObject);
    procedure DataFromForm();
    procedure Menu_SpravkaClick(Sender: TObject);
    procedure Rs_buttonClick(Sender: TObject);
  private

  public

  end;

var
  Form_Progression: TForm_Progression;
  flag:boolean;
  S,a,d:real;
  n:integer;

implementation

{$R *.lfm}

{ TForm_Progression }

procedure TForm_Progression.FormCreate(Sender: TObject);
begin
  flag:=true;
  Edit_a.Text:='1';
  Edit_d.text:='1';
  Edit_n.text:='1';
end;


//Процедуры перевода курсора
procedure TForm_Progression.Edit_aKeyPress(Sender: TObject; var Key: char);
begin
  if key = #13 then
    edit_d.SetFocus;
end;
procedure TForm_Progression.Edit_dKeyPress(Sender: TObject; var Key: char);
begin
  if key = #13 then
    edit_n.SetFocus;
end;
procedure TForm_Progression.Edit_nKeyPress(Sender: TObject; var Key: char);
begin
  if key = #13 then
    rs_button.SetFocus;
end;



//
procedure TForm_Progression.Menu_exitClick(Sender: TObject);
begin
  if messagedlg('Выход','Вы точно хотите выйти?',mtConfirmation,
                [mbYes,mbNo],0) = mrYes then
    Close;
end;


//
procedure TForm_Progression.Menu_FileSaveClick(Sender: TObject);
var f:text;
begin
  DataFromForm();
  if flag=true then
    begin
  if SaveDialog1.Execute then
    if SaveDialog1.FileName <> '' then
      begin
        save_params(Edit_a.text,Edit_d.text,n, SaveDialog1.FileName);
      end;
    end
  else
    begin
      flag:=true;
      exit;
    end;
end;


//
procedure TForm_Progression.Menu_OpenFileClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    begin
      if OpenDialog1.FileName <> '' then
        begin
          read_params(a,d,n,OpenDialog1.FileName);
          Edit_a.Text:=floattostr(a);
          Edit_d.Text:=floattostr(d);
          Edit_n.Text:=inttostr(n);

        end;
    end;
end;


//
procedure TForm_Progression.Menu_SaveResultClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
    if SaveDialog1.FileName <> '' then
      Memo_Result.Lines.SaveToFile(SaveDialog1.FileName);
end;


//
procedure  TForm_Progression.DataFromForm();   //определение метода класса.
begin
  if TryStrToFloat(Edit_a.Text,a)= false then
    begin
      ShowMessage('Неправильно введен параметр a');
      flag:=false;
      exit;
    end;

   if TryStrToFloat(Edit_d.Text,d)= false then
    begin
      ShowMessage('Неправильно введен параметр d');
      flag:=false;
      exit;
    end;

   if TryStrToint(Edit_n.Text,n)= false then
    begin
      ShowMessage('Неправильно введен параметр n');
      flag:=false;
      exit;
    end;

end;


//
procedure TForm_Progression.Menu_SpravkaClick(Sender: TObject);
begin
  showmessage('Студент Группы ИВТ-19-1 Будников Даниил, задача №20, Найти сумму арифметической прогрессии по данным значениям a,d,n ; http://чибгу.рф/zadachnik/Glava01/index01.htm#z20');
end;


//
procedure TForm_Progression.Rs_buttonClick(Sender: TObject);
begin
  DataFromForm();
  if flag=true then
    begin
      a:= strtofloat(edit_a.Text);
      d:= strtofloat(edit_d.Text);
      n:= strtoint(edit_n.Text);

      S:=calc_progression(a,d,n);
      Memo_result.Append('При  a= '+floattostr(a));
      Memo_result.Append('При  d= '+floattostr(d));
      Memo_result.Append('При  n= '+inttostr(n));
      Memo_result.Lines.Add(' Сумма арифметической прогрессии равна : '+floattostr(S));
      memo_result.Lines.Add('--------------------------');
      memo_result.Lines.Add(' ');
    end
  else
    begin
      flag:=true;
      exit;
    end;
end;

end.

