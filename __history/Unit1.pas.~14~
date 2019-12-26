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
  xpr1, ypr1, xpr2, ypr2, xl1, xl2, xl3, xl4, yl1, yl2, yl3, yl4: Integer;
  k, b: real;

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

procedure TForm1.Button3Click(Sender: TObject); // Процедура отсечения

var
  p1, p2: byte;
  x0, y0: Integer;
  stop: boolean;
  FLAG, flag2, FlagFirstIn, FlagSecondIn: boolean;
  S, S2: STRiNG;

  // function MoveToStart(xl, Yl, xpr, ypr: Integer): string;
  // begin
  //
  // result := false;
  //
  // if (((xpr - 1 { погрешность } ) <= xl) and (xl <= (xpr + 1 { погрешность } )
  // ) and (Yl = ypr)) then
  // begin
  // result := true;
  // end
  //
  // else if (((xpr1 - 1 { погрешность } ) <= xl2) and
  // (xl2 <= (xpr2 + 1 { погрешность } )) and (yl2 = ypr1)) then
  // begin
  // result := true;
  // end
  //
  // else if (((xpr1 - 1 { погрешность } ) <= xl3) and
  // (xl3 <= (xpr2 + 1 { погрешность } )) and (yl3 = ypr1)) then
  // begin
  // result := true;
  // end
  //
  // else if (((xpr1 - 1 { погрешность } ) <= xl4) and
  // (xl4 <= (xpr2 + 1 { погрешность } )) and (yl4 = ypr1)) then
  // begin
  // result := true;
  // end;
  //
  // end;
  //
  // procedure LineToEnd();
  // begin
  //
  // end;

begin

  Image1.Canvas.FillRect(Form1.ClientRect);

  Image1.Canvas.Rectangle(xpr1, ypr1, xpr2, ypr2);

  k := (y1 - y2) / (x1 - x2);
  b := y2 - k * x2;

  // пересечение с левой линией

  FlagFirstIn := false;
  FlagSecondIn := false;

  if (xpr1 < x1) and (x1 < xpr2) and (ypr1 < y1) and (y1 < ypr2) then
  begin
    xl1 := x1;
    yl1 := y1;
    FlagFirstIn := true;
  end
  else
  begin
    xl1 := xpr1;
    yl1 := round(k * xl1 + b);
  end;

  if (xpr1 < x2) and (x2 < xpr2) and (ypr1 < y2) and (y2 < ypr2) then
  begin
    xl2 := x2;
    yl2 := y2;
    FlagSecondIn := true;
  end
  else
  begin
    xl2 := xpr2;
    yl2 := round(k * xl2 + b);
  end;




  // пересечение с правой

  // пересечение с верхней линией
  yl3 := ypr1;
  xl3 := round((yl3 - b) / k);

  // пересечение с нижней линией

  yl4 := ypr2;
  xl4 := round((yl4 - b) / k);

  // определение по каким точкам отсекать
  // начальные точки отрезка начало

  FLAG := true;
  flag2 := true;

  if (((xpr1 - 1 { погрешность } ) <= xl1) and
    (xl1 <= (xpr2 + 1 { погрешность } )) and ((yl1 = ypr1)or ((ypr1 < yl1) and (yl1 < ypr2)))) then
  begin
    if FLAG then
    begin
      S := 'T1';
      Image1.Canvas.MoveTo(xl1, yl1);
      FLAG := false;
    end
    else if flag2 then
    begin
      S2 := 'T1';
      flag2 := false;
      Image1.Canvas.LineTo(xl1, yl1);
    end;

  end

  else if (((xpr1 - 1 { погрешность } ) <= xl2) and
    (xl2 <= (xpr2 + 1 { погрешность } )) and ((yl2 = ypr1)or ((ypr1 < yl2) and (yl2 < ypr2)))) then
  begin

    if FLAG then
    begin
      S := 'T1';
      Image1.Canvas.MoveTo(xl2, yl2);
      FLAG := false;
    end
    else if flag2 then
    begin
      S2 := 'T1';
      flag2 := false;
      Image1.Canvas.LineTo(xl2, yl2);
    end;

  end

  else if (((xpr1 - 1 { погрешность } ) <= xl3) and
    (xl3 <= (xpr2 + 1 { погрешность } )) and ((yl3 = ypr1)or ((ypr1 < yl3) and (yl3 < ypr2)))) then
  begin
    if FLAG then
    begin
      S := 'T1';
      Image1.Canvas.MoveTo(xl3, yl3);
      FLAG := false;
    end
    else if flag2 then
    begin
      S2 := 'T1';
      flag2 := false;
      Image1.Canvas.LineTo(xl3, yl3);
    end;
  end

  else if (((xpr1 - 1 { погрешность } ) <= xl4) and
    (xl4 <= (xpr2 + 1 { погрешность } )) and ((yl4 = ypr1)or ((ypr1 < yl4) and (yl4 < ypr2)))) then
  begin
    if FLAG then
    begin
      S := 'T1';
      Image1.Canvas.MoveTo(xl4, yl4);
      FLAG := false;
    end
    else if flag2 then
    begin
      S2 := 'T1';
      flag2 := false;
      Image1.Canvas.LineTo(xl4, yl4);
    end;
  end;

  if (((xpr1 - 1 { погрешность } ) <= xl1) and
    (xl1 <= (xpr2 + 1 { погрешность } )) and ((yl1 = ypr1)or ((ypr1 < yl1) and (yl1 < ypr2)))) then
  begin
    if FLAG then
    begin
      S := 'T1';
      Image1.Canvas.MoveTo(xl1, yl1);
      FLAG := false;
    end
    else if flag2 then
    begin
      S2 := 'T1';
      flag2 := false;
      Image1.Canvas.LineTo(xl1, yl1);
    end;

  end

  else if (((xpr1 - 1 { погрешность } ) <= xl2) and
    (xl2 <= (xpr2 + 1 { погрешность } )) and ((yl2 = ypr1)or ((ypr1 < yl2) and (yl2 < ypr2)))) then
  begin
    if FLAG then
    begin
      S := 'T1';
      Image1.Canvas.MoveTo(xl2, yl2);
      FLAG := false;
    end
    else if flag2 then
    begin
      S2 := 'T1';
      flag2 := false;
      Image1.Canvas.LineTo(xl2, yl2);
    end;
  end

  else if (((xpr1 - 1 { погрешность } ) <= xl3) and
    (xl3 <= (xpr2 + 1 { погрешность } )) and ((yl3 = ypr1)or ((ypr1 < yl3) and (yl3 < ypr2)))) then
  begin
    if FLAG then
    begin
      S := 'T1';
      Image1.Canvas.MoveTo(xl3, yl3);
      FLAG := false;
    end
    else if flag2 then
    begin
      S2 := 'T1';
      flag2 := false;
      Image1.Canvas.LineTo(xl3, yl3);
    end;
  end

  else if (((xpr1 - 1 { погрешность } ) <= xl4) and
    (xl4 <= (xpr2 + 1 { погрешность } )) and ((yl4 = ypr1)or ((ypr1 < yl4) and (yl4 < ypr2)))) then
  begin
    if FLAG then
    begin
      S := 'T1';
      Image1.Canvas.MoveTo(xl4, yl4);
      FLAG := false;
    end
    else if flag2 then
    begin
      S2 := 'T1';
      flag2 := false;
      Image1.Canvas.LineTo(xl4, yl4);
    end;
  end;

  if (((ypr1 - 1 { погрешность } ) <= yl1) and
    (yl1 <= (ypr2 + 1 { погрешность } )) and ((xl1 = xpr1)or ((xpr1 < xl1) and (xl1 < xpr2)) )) then
  begin
    if FLAG then
    begin
      S := 'T1';
      Image1.Canvas.MoveTo(xl1, yl1);
      FLAG := false;
    end
    else if flag2 then
    begin
      S2 := 'T1';
      flag2 := false;
      Image1.Canvas.LineTo(xl1, yl1);
    end;

  end

  else if (((ypr1 - 1 { погрешность } ) <= yl2) and
    (yl2 <= (ypr2 + 1 { погрешность } )) and ((xl2 = xpr1)or ((xpr1 < xl2) and (xl2 < xpr2)) )) then
  begin
    if FLAG then
    begin
      S := 'T1';
      Image1.Canvas.MoveTo(xl2, yl2);
      FLAG := false;
    end
    else if flag2 then
    begin
      S2 := 'T1';
      flag2 := false;
      Image1.Canvas.LineTo(xl2, yl2);
    end;
  end

  else if (((ypr1 - 1 { погрешность } ) <= yl3) and
    (yl3 <= (ypr2 + 1 { погрешность } )) and ((xl3 = xpr1)or ((xpr1 < xl3) and (xl3 < xpr2)) )) then
  begin
    if FLAG then
    begin
      S := 'T1';
      Image1.Canvas.MoveTo(xl3, yl3);
      FLAG := false;
    end
    else if flag2 then
    begin
      S2 := 'T1';
      flag2 := false;
      Image1.Canvas.LineTo(xl3, yl3);
    end;
  end

  else if (((ypr1 - 1 { погрешность } ) <= yl4) and
    (yl4 <= (ypr2 + 1 { погрешность } )) and ((xl4 = xpr1)or ((xpr1 < xl4) and (xl4 < xpr2)) )) then
  begin
    if FLAG then
    begin
      S := 'T1';
      Image1.Canvas.MoveTo(xl4, yl4);
      FLAG := false;
    end
    else if flag2 then
    begin
      S2 := 'T1';
      flag2 := false;
      Image1.Canvas.LineTo(xl4, yl4);
    end;;
  end;

  if (((ypr1 - 1 { погрешность } ) <= yl1) and
    (yl1 <= (ypr2 + 1 { погрешность } )) and ((xl1 = xpr1)or ((xpr1 < xl1) and (xl1 < xpr2)) )) then
  begin
    if FLAG then
    begin
      S := 'T1';
      Image1.Canvas.MoveTo(xl1, yl1);
      FLAG := false;
    end
    else if flag2 then
    begin
      S2 := 'T1';
      flag2 := false;
      Image1.Canvas.LineTo(xl1, yl1);
    end;
  end

  else if (((ypr1 - 1 { погрешность } ) <= yl2) and
    (yl2 <= (ypr2 + 1 { погрешность } )) and ((xl2 = xpr1)or ((xpr1 < xl2) and (xl2 < xpr2)) )) then
  begin
    if FLAG then
    begin
      S := 'T1';
      Image1.Canvas.MoveTo(xl2, yl2);
      FLAG := false;
    end
    else if flag2 then
    begin
      S2 := 'T1';
      flag2 := false;
      Image1.Canvas.LineTo(xl2, yl2);
    end;
  end

  else if (((ypr1 - 1 { погрешность } ) <= yl3) and
    (yl3 <= (ypr2 + 1 { погрешность } )) and ((xl3 = xpr1)or ((xpr1 < xl3) and (xl3 < xpr2)) )) then
  begin
    if FLAG then
    begin
      S := 'T1';
      Image1.Canvas.MoveTo(xl3, yl3);
      FLAG := false;
    end
    else if flag2 then
    begin
      S2 := 'T1';
      flag2 := false;
      Image1.Canvas.LineTo(xl3, yl3);
    end;
  end

  else if (((ypr1 - 1 { погрешность } ) <= yl4) and
    (yl4 <= (ypr2 + 1 { погрешность } )) and ((xl4 = xpr1)or ((xpr1 < xl4) and (xl4 < xpr2)) )) then
  begin
    if FLAG then
    begin
      S := 'T1';
      Image1.Canvas.MoveTo(xl4, yl4);
      FLAG := false;
    end
    else if flag2 then
    begin
      S2 := 'T1';
      flag2 := false;
      Image1.Canvas.LineTo(xl4, yl4);
    end;
  end;

  if S[1] = 'T' then
    if S[2] = '1' then




      // начальные точки отрезка конец


      // конечные точки отр нач



      // конечные точки отр кон

      // Рисуем отрезок
      // Image1.Canvas.LineTo(xpr2, ypr2);

      // stop := false;
      // repeat
      // p1 := kod(x1, y1, xpr1, ypr1, xpr2, ypr2);
      // // Присваивание кода точке с координатами (x,y)
      // p2 := kod(x2, y2, xpr1, ypr1, xpr2, ypr2); // -//-
      // if (not((p1 and p2) <> 0)) then // Если отрезок полностью невидим
      // begin
      // if ((p1 = 0) and (p2 = 0)) then // Если отрезок видим полностью
      // begin // то рисуем его (проводим линию от точки с координатами (х1,y1) до точки - (x2,y2)
      // Image1.Canvas.FillRect(Image1.ClientRect);
      // Image1.Canvas.Rectangle(xpr1, ypr1, xpr2, ypr2);
      // Image1.Canvas.MoveTo(x1, y1);
      // Image1.Canvas.LineTo(x2, y2);
      // exit;
      // end
      // else
      // begin
      // if p1 = 0 then
      // // Если р1=0 - поменять местами точки (x1,y1) и (x2,y2),чтобы обработка шла каждый раз с точки, находящейся вне окна
      // begin
      // x0 := x1;
      // x1 := x2;
      // x2 := x0;
      // y0 := y1;
      // y1 := y2;
      // y2 := y0;
      // p1 := p2;
      // end;
      // if x1 < xpr1 then
      // // Если точка (x1,y1) - слева от окна - найти ее новые координаты по фор-мулам
      // begin
      // y1 := y1 + (y2 - y1) * (xpr1 - x1) div (x2 - x1);
      // x1 := xpr1;
      // end
      // else if y1 < ypr1 then
      // // Если точка (x1,y1) - выше окна - найти ее новые координаты по формулам
      // begin
      // x1 := x1 + (x2 - x1) * (ypr1 - y1) div (y2 - y1);
      // y1 := ypr1;
      // end
      // else if x1 > xpr2 then
      // // Если точка (x1,y1)- справа от окна - найти ее новые координаты по формулам
      // begin
      // y1 := y1 + (y2 - y1) * (xpr2 - x1) div (x2 - x1);
      // x1 := xpr2;
      // end
      // else if y1 > ypr2 then
      // begin
      // x1 := x1 + (x2 - x1) * (ypr2 - y1) div (y2 - y1);
      // y1 := ypr2;
      // end;
      // end;
      // end
      // else
      // begin
      // Image1.Canvas.FillRect(Image1.ClientRect);
      // Image1.Canvas.Rectangle(xpr1, ypr1, xpr2, ypr2);
      // exit;
      // end;
      // until stop;
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
