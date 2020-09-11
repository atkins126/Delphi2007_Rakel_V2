unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, JPEG, Menus;

type
  TForm3 = class(TForm)
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    jpg1: TMenuItem;
    N3: TMenuItem;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    Button1: TButton;
    Panel1: TPanel;
    RzSaveDialog1: TSaveDialog;
    N4: TMenuItem;
    Image2: TImage;
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure jpg1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fl_no_m: boolean;
    path_n: string;
  end;

var
  Form3: TForm3;
  bm5: TBitmap;
implementation

uses Unit1;

{$R *.dfm}

var
  LoopAborted: Boolean;
  MyImage: TBitmap;
  fl_complet: boolean;


procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  LoopAborted := True;
end;

procedure TForm3.FormDestroy(Sender: TObject);
begin
  MyImage.Free;
  bm5.Free;
  image1.canvas.fillrect(image1.canvas.cliprect);
end;

procedure TForm3.FormResize(Sender: TObject);
begin
  Panel1.Left := (Self.Width div 2) - (Panel1.Width div 2);
  Panel1.Top := (Self.Height div 2) - (Panel1.Height div 2);
end;

procedure TForm3.FormShow(Sender: TObject);
var
  w, i: integer;
begin
  MyImage := TBitmap.Create;
  MyImage.Width := 15;
  MyImage.Height := 15;

  bm5 := TBitmap.Create;
  bm5.Assign(form1.image2.Picture.Bitmap);
  Image1.Width := bm5.Width * 15 + 50;
  Image1.Height := bm5.Height * 15 + 50;
  image1.canvas.fillrect(image1.canvas.cliprect);

  Button1.Top := Image1.Height + 3;

  w := 1;
  for i := 0 to 99 do
  begin
    if Acolor[i] <> -1 then
    begin
      w := w + 1;
    end;
  end;

  Image2.Width := w*15+50;
  Image2.Height := 100;

  Form3.caption := inttostr(Image1.Width) + 'X' + inttostr(Image1.Height);
end;

procedure TForm3.Image1DblClick(Sender: TObject);
begin

  if Image1.Proportional then
  begin
    Image1.Proportional := false;
    Image1.Align := alCustom;
  end
  else
  begin
    Image1.Proportional := true;
    Image1.Align := alClient;
  end;

end;

procedure kubik(X, Y: integer; Col: Tcolor; text: string);
var
  TmpX, TmpY: Byte;

  OldBkMode: integer;
begin

  for TmpX := 0 to 15 do
    for TmpY := 0 to 15 do
    begin
      if (TmpX = 0) or (TmpX = 15) or (TmpY = 0) or (TmpY = 15)
        then MyImage.Canvas.Pixels[TmpX, TmpY] := 0 else
        MyImage.Canvas.Pixels[TmpX, TmpY] := Col;
      OldBkMode := SetBkMode(MyImage.Canvas.Handle, TRANSPARENT);
      if length(text) = 2 then MyImage.Canvas.TextOut(2, 1, text) else
        MyImage.Canvas.TextOut(5, 1, text);

      if Col <= 3000000 then
        SetTextColor(MyImage.Canvas.Handle, rgb((150), (150), (150)))
      else SetTextColor(MyImage.Canvas.Handle, rgb((0), (0), (0)));

      SetBkMode(MyImage.Canvas.Handle, OldBkMode);
    end;

  Form3.Image1.Canvas.Draw(X * 15, Y * 15, MyImage);
 //
end;


procedure kubik2(X, Y: integer; Col: Tcolor; text: string);
var
  TmpX, TmpY: Byte;

  OldBkMode: integer;
begin

  for TmpX := 0 to 15 do
    for TmpY := 0 to 15 do
    begin
      if (TmpX = 0) or (TmpX = 15) or (TmpY = 0) or (TmpY = 15)
        then MyImage.Canvas.Pixels[TmpX, TmpY] := 0 else
        MyImage.Canvas.Pixels[TmpX, TmpY] := Col;
      OldBkMode := SetBkMode(MyImage.Canvas.Handle, TRANSPARENT);
      if length(text) = 2 then MyImage.Canvas.TextOut(2, 1, text) else
        MyImage.Canvas.TextOut(5, 1, text);

      if Col <= 3000000 then
        SetTextColor(MyImage.Canvas.Handle, rgb((150), (150), (150)))
      else SetTextColor(MyImage.Canvas.Handle, rgb((0), (0), (0)));

      SetBkMode(MyImage.Canvas.Handle, OldBkMode);
    end;

  Form3.Image2.Canvas.Draw(X * 15, Y * 15, MyImage);
 //
end;



procedure TForm3.N1Click(Sender: TObject);
var
  i, j, x, y, l, k, n, t: Integer;
  w:integer;
begin
  Image1.Width := form1.image2.Picture.Bitmap.Width * 15 + 50;
  Image1.Height := form1.image2.Picture.Bitmap.Height * 15 + 50;
  Button1.Top := Image1.Height + 3;

  w := 1;
  for i := 0 to 99 do
  begin
    if Acolor[i] <> -1 then
    begin
      w := w + 1;
    end;
  end;

  fl_complet := false;
  Panel1.Visible := TRUE;
  LoopAborted := false;


  x := bm5.Height;
  y := bm5.Width;
  k := 1;
  n := 1;


  for j := 1 to y - 1 do
  begin
    form3.Caption := inttostr(round(100 * j / y)) + ' % выполненно';
    Application.ProcessMessages;
    if GetKeyState(VK_Escape) and 128 = 128 then
    begin
      Form3.Caption := 'Прервано';
      LoopAborted := True;
      Break;
    end;

    for i := 1 to x - 1 do
    begin

      if length(inttostr(i - 1)) = 2 then t := 0 else t := 5;

      if (I = 1) and (j = k) then
      begin
        Image1.Canvas.TextOut(2, J * 15, inttostr(j - 1));
        k := k + 5;
      end;


      if (J = 1) and (i = n) then
      begin
        Image1.Canvas.TextOut(i * 15 + t, 2, inttostr(i - 1));
        n := n + 5;
      end;



      for l := 0 to 99 do
      begin
        if Acolor[l] = Bm5.Canvas.Pixels[j, i] then
          kubik(j, i, Bm5.Canvas.Pixels[j, i], inttostr(L));
      end;

    end;
  end;


   //После всего выведем путеводитель

  for l := 0 to 99 do
  begin
    if Acolor[l] <> -1 then
    begin
      kubik(2 + l, x + 1, Acolor[l], '');
      kubik(2 + l, x + 2, 3500000, inttostr(L));
    end;
  end;

  x := 2;
  for l := 0 to 99 do
  begin
    if Acolor[l] <> -1 then
    begin
      kubik2(2 + l, x + 1, Acolor[l], '');
      kubik2(2 + l, x + 2, 3500000, inttostr(L));
    end;
  end;


  if not LoopAborted then

    fl_complet := true;
  if not fl_no_m then
    showmessage('Готово. Теперь Вы можете сохранить результат');
  Panel1.Visible := false;
end;


procedure TForm3.N2Click(Sender: TObject);
begin
  RzSaveDialog1.DefaultExt := '.bmp';
  RzSaveDialog1.Filter := '*.bmp|*.bmp';

  if RzSaveDialog1.Execute then
    image1.Picture.SaveToFile(RzSaveDialog1.FileName);
end;

procedure TForm3.N3Click(Sender: TObject);
begin
  image1.canvas.fillrect(image1.canvas.cliprect);
end;

procedure TForm3.N4Click(Sender: TObject);
var
  jpg: TJpegImage;
begin
  N1.Click;

  while not fl_complet do
  begin
    Application.ProcessMessages;

  end;
  ForceDirectories(ExtractFilePath(Application.ExeName) + '/' + path_n);
  image1.Picture.SaveToFile(ExtractFilePath(Application.ExeName) + '/' + path_n + '/' + path_n + '.bmp');
  jpg := TJpegImage.Create;
//bmp.Canvas.StretchDraw( image1.Canvas.Cliprect, jpg );
  jpg.Assign(image1.Picture.Bitmap);
  jpg.SaveToFile(ExtractFilePath(Application.ExeName) + '/' + path_n + '/' + path_n + '.jpg');
  close;

  jpg.Assign(Image2.Picture.Bitmap);
  jpg.SaveToFile(ExtractFilePath(Application.ExeName) + '/' + path_n + '/palitra.jpg');
  jpg.Free;

end;

procedure TForm3.jpg1Click(Sender: TObject);
var
  jpg: TJpegImage;
begin
  RzSaveDialog1.DefaultExt := '.jpg';
  RzSaveDialog1.Filter := '*.jpg|*.jpg';

  if RzSaveDialog1.Execute then
  begin
    jpg := TJpegImage.Create;
//bmp.Canvas.StretchDraw( image1.Canvas.Cliprect, jpg );
    jpg.Assign(image1.Picture.Bitmap);
    jpg.SaveToFile(ChangeFileext(RzSaveDialog1.filename, '.jpg'));

  end;
end;

end.

