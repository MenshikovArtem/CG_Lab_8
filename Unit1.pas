unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  otr, pr, otr1: boolean;
  i: Integer;
  x1, y1, x2, y2, xr1, xr2, yr1, yr2: Integer;
  xle, xr, yt, yb, xpr1, ypr1, xpr2, ypr2, xl1, xl2, xl3, xl4, yl1, yl2, yl3,
    yl4: Integer;
  k, b: real;

  T1code: array [1 .. 4] of Integer;
  T2code: array [1 .. 4] of Integer;

implementation

{$R *.dfm}

function kod(X, Y, xl, ya, xr, yb: Integer): byte;
// Присваивание кода точке с координатами (x,y)
var
  kp: byte;
begin
  kp := 0;
  if X < xl then
    kp := kp or $01; // (xl,ya),(xr,yb) - координаты левого верхнего
  if Y < ya then
    kp := kp or $02; // и правого нижнего углов окна
  if X > xr then
    kp := kp or $04;
  if Y > yb then
    kp := kp or $08;
  kod := kp // kod - результирующий код
end;

procedure TForm1.FormCreate(Sender: TObject); // Создание формы
begin
  otr := false;
  pr := false; // Присваиваем булевым переменным значение False
  otr1 := false;
  i := 1;
end;

procedure TForm1.Button1Click(Sender: TObject); // Процедура рисования отрезка
begin
  Showmessage('Выберите две точки, обозначающие концы отрезка...');
  // Поясняющий комментарий для пользователя
  if Button1.Caption = 'Нарисовать отрезок' then
  begin
    otr := true; // Присванивание булевой переменной otr значения True
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
// Процедура рисования прямоугольнкиа
begin
  Showmessage
    ('Выберите две диагональные точки, по которым будет построен прямоугольник...');
  // Поясняющий комментарий для пользователя
  pr := true; // Присваиваем булевой переменной pr значение True
end;

procedure TForm1.Button4Click(Sender: TObject); // Процедура очистки
begin
  otr := false; // Сбрасываем булевы переменные
  pr := false;
  i := 1;

  Image1.Canvas.FillRect(Form1.ClientRect); // Очищаем
  otr1 := false;
  Showmessage('Очистка выполнена!'); // Поясняющий комментарий для пользователя
end;

Function Min(a, b: Integer): Integer;
begin

  if b <= a then
    result := b
  else
    result := a;

end;

Function Max(a, b: Integer): Integer;
begin

  if b >= a then
    result := b
  else
    result := a;

end;

function BoolToInt(f: boolean): Integer;
begin

  if f then
    result := 1
  else
    result := 0;

end;

procedure TForm1.Button3Click(Sender: TObject); // Процедура отсечения

var
  p1, p2: byte;
  x0, y0, x1new, x2new, y1new, y2new,sum1,sum2: Integer;
  stop: boolean;
  FLAG, flag2, FlagFirstIn, FlagSecondIn: boolean;
  S, S2: STRiNG;
  label l1,l2,l3,l4,l5,l6,l7,l8;

begin

  Image1.Canvas.FillRect(Form1.ClientRect);

  Image1.Canvas.Rectangle(xpr1, ypr1, xpr2, ypr2);

  k := (y1 - y2) / (x1 - x2);
  b := y2 - k * x2;

  // (x1,y1)(x2,y2)-координаты отрезка
  // (xpr1,ypr1)(xpr2,ypr2) -

  xle := Min(xpr1, xpr2);
  xr := Max(xpr1, xpr2);
  yt := Min(ypr1, ypr2);
  yb := Max(ypr1, ypr2);

  T1code[4] := BoolToInt(x1 < xle);
  T1code[3] := BoolToInt(x1 > xr);
  T1code[2] := BoolToInt(y1 > yb);
  T1code[1] := BoolToInt(y1 < yt);

  T2code[4] := BoolToInt(x2 < xle);
  T2code[3] := BoolToInt(x2 > xr);
  T2code[2] := BoolToInt(y2 > yb);
  T2code[1] := BoolToInt(y2 < yt);

  FLAG := false;
  x1new := x1;
  x2new := x2;
  y1new := y1;
  y2new := y2;
  k := high(xr); // максимальное число типа переменной xr т е инта

  sum1:=0;
  sum2:=0;

  for i  := 1 to 4 do
    begin
      sum1:=sum1 +  T1code[i];
      sum2:=sum2 +  T2code[i];
    end;

  if (sum1 = 0) and (sum2 = 0) then 
  

end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
// Событие нажатия на клавишу мыши по Image1
begin
  if otr then // Если рисуем отрезок (булева переменна otr равна true)
  begin
    case i of // Проверяем счетчик
      1:
        begin
          x1 := X; // Считываем координаты первой точки отрезка
          y1 := Y;

        end;
      2:
        begin
          x2 := X; // Считываем координаты второй точки отрезка
          y2 := Y;

          Image1.Canvas.MoveTo(x1, y1); // Рисуем отрезок
          Image1.Canvas.LineTo(x2, y2);
          otr := false;
          // Закончили рисовать отрезок, присваиваем булевой переменной otr значение False
          i := 0; // Сбрасываем счетчик i, присваиваем переменной i значение 0
          otr1 := true;
          // Чтобы отрезки не пропали, присваиваем переменной otr1 значение true
        end;
    end;
    inc(i); // Инкрементируем переменную i
  end
  else if pr then // Если рисуем прямоугольник (булева переменная pr равна True
  begin
    case i of // Проверяем счетчик
      1:
        begin
          xpr1 := X; // Считвыаем координаты левой верхней точки
          ypr1 := Y;
        end;
      2:
        begin
          xpr2 := X; // Считвыаем координаты правой нижней точки
          ypr2 := Y;
          Image1.Canvas.Rectangle(xpr1, ypr1, xpr2, ypr2);
          // Рисуем прямоугольник по считанным координатам
          pr := false;
          // Закончили рисовать прямоугольник, присваиваем будевой переменной pr значение False
          i := 0; // Сбрасываем счетчик
          if otr1 then
          // Рисуем прямые поверх прямоугольника, чтобы они не пропали после рисования прямоугольника
          begin
            Image1.Canvas.MoveTo(x1, y1); // Рисуем отрезок
            Image1.Canvas.LineTo(x2, y2);
            otr1 := false;
            // Закончили перерисовку отрезков, присваиваем булевой переменной otr1 значение False
          end;
        end;
    end;
    inc(i); // Инкрементируем счетчик
  end;
end;

end.
