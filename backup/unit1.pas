unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Menus;

type

  { TForm1 }

  TForm1 = class(TForm)
    FontDlg: TFontDialog;
    LabelClock: TLabel;
    MenuItemFont: TMenuItem;
    MenuItemExit: TMenuItem;
    PopupMenu1: TPopupMenu;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure MenuItemExitClick(Sender: TObject);
    procedure MenuItemFontClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    procedure AdjustFormSize;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  // FormatDateTime форматирует текущее время (Now) по шаблону 'hh:nn:ss'
  LabelClock.Caption := FormatDateTime('hh:nn:ss', Now);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Position := poScreenCenter;
  Timer1.Enabled := True;
  AdjustFormSize; // сразу подгоняем под дефолтный шрифт
end;

procedure TForm1.AdjustFormSize;
var
  W, H: Integer;
begin
  LabelClock.Update; // пересчёт размеров текста после смены шрифта

  // Запас по краям
  W := LabelClock.Width + 40;
  H := LabelClock.Height + 40;

  // Устанавливаем размер окна
  Width := W;
  Height := H;

  // Запираем окно: min = max = текущий размер
  Constraints.MinWidth := W;
  //Constraints.MaxWidth := W;
  Constraints.MinHeight := H;
  //Constraints.MaxHeight := H;
end;


procedure TForm1.MenuItemExitClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.MenuItemFontClick(Sender: TObject);
begin
    if FontDlg.Execute then
  begin
    LabelClock.Font := FontDlg.Font;
    // Опционально: подгоняем размер формы под новый шрифт
    AdjustFormSize;
  end;
end;

end.

