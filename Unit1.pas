unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, inifiles, Menus, ClipBrd, ImgList, GIFImg,
  jpeg, Mask, ComObj, ShellAPI, ComCtrls, cxGraphics, cxControls, PNGImage,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxCheckBox,
  ExtDlgs, cxProgressBar, cxImageList, cxButtons, dxGDIPlusClasses, cxImage,
  cxTextEdit;


const
  Hlp_Presentation = 1;
  Hlp_Remerciement = 2;
  Hlp_BarreTitre = 3;
  Hlp_LesJauges = 4;
  Hlp_Options = 5;
  Hlp_Touches = 6;
  Hlp_LesBoutons = 7;
  Hlp_CouleursEn = 8;
  Hlp_Aide = 9;


type
  TForm1 = class(TForm)
    ImageBtnAjoute: TImage;
    ImageBtnCompact: TImage;
    ImageBtnEfface: TImage;
    ImageBtnExtraire: TImage;
    ImageBtnIconeQuitter: TImage;
    ImageBtnLoad: TImage;
    ImageBtnMini: TImage;
    ImageBtnNew: TImage;
    ImageBtnOptions: TImage;
    ImageBtnSave: TImage;
    ImageBtnTrier: TImage;
    ImageFond: TImage;
    ImageTitre: TImage;
    ImStock: TImage;

    St1: TStaticText;
    St2: TStaticText;
    St3: TStaticText;
    St4: TStaticText;
    St5: TStaticText;

    ImageList1: TImageList;

    ColorDialog1: TColorDialog;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    Panel2: TPanel;
    Image2: TImage;
    RzOpenDialog1: TOpenDialog;
    RzSaveDialog1: TSaveDialog;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    PopupMenu2: TPopupMenu;
    N2: TMenuItem;
    PopupMenu3: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    cxImageList1: TcxImageList;
    Panel5: TPanel;
    Panel4: TPanel;
    RzToolButton1: TcxButton;
    RzToolButton7: TcxButton;
    RzToolButton5: TcxButton;
    TrackBar1: TTrackBar;
    Panel1: TPanel;
    RzStatusPane1: TPanel;
    ScrollBox1: TScrollBox;
    RzToolButton4: TcxButton;
    Panel6: TPanel;
    ImRouge: TImage;
    ImVert: TImage;
    Imbleu: TImage;
    ImDegrade: TImage;
    Panelcouleur: TPanel;
    ImageBtnEclaircir: TImage;
    ImageBtnAssombrire: TImage;
    PanelChrom: TPanel;
    ImageChrom: TImage;
    Excel1: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    SavePictureDialog1: TSavePictureDialog;
    RzOpenDialog2: TOpenDialog;
    RzToolButton3: TcxButton;
    RzToolButton8: TcxButton;
    cxProgressBar1: TcxProgressBar;
    cxImage1: TcxImage;
    cxTextEdit1: TcxTextEdit;
    cxButton1: TcxButton;

    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Ic(n: Integer; Icon: TIcon);
    function color_existe(c: Tcolor): boolean;
    function selection_suivante: Boolean;

    procedure Trier_Les_couleurs;
    procedure Affiche_Jauge(Couleur: Tcolor);
    procedure DrawGradient(ACanvas: TCanvas; Rect: TRect; Horicontal: Boolean; Colors: array of TColor);
    procedure Dessine_Btn(Canvas: Tcanvas; glyph: shortint; Text: string; up: boolean);
    procedure sauve_ini;
    procedure charge_ini;
    procedure Dessine_Stock;
    procedure Dessine_Jauge(im: Timage; couleur: Tcolor; Valeur: Integer; RegCol: byte);
    procedure dessine_titre(canvas: Tcanvas; Text, soustitre: string);
    procedure actualise;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Charge_fichier(nom: string);
    procedure sauve_fichier(nom: string);
    procedure ImJaugeMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ImJaugeMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ImJaugeMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure ImStockDBClick(Sender: TObject);
    procedure ImStockMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure ImStockMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ImStockMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    procedure ImageBtnIconeDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ImageBtnIconeUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    procedure ImageBtnMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ImageBtnMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    procedure ImageTitreMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    procedure ImageChromMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure ImageChromClick(Sender: TObject);
    procedure ImDegradeMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure ImDegradeClick(Sender: TObject);
    procedure PanelcouleurDblClick(Sender: TObject);

    procedure ImageBtnAideClick(Sender: TObject);
    procedure ImageBtnAssombrireClick(Sender: TObject);
    procedure ImageBtnClipBoardClick(Sender: TObject);
    procedure ImageBtnCompactClick(Sender: TObject);
    procedure ImageBtnEclaircirClick(Sender: TObject);
    procedure ImageBtnEffaceClick(Sender: TObject);
    procedure ImageBtnLoadClick(Sender: TObject);
    procedure ImageBtnMiniClick(Sender: TObject);
    procedure ImageBtnNewClick(Sender: TObject);
    procedure ImageBtnOptionsClick(Sender: TObject);
    procedure ImageBtnQuitterClick(Sender: TObject);
    procedure ImageBtnSaveClick(Sender: TObject);
    procedure ImageBtnTrierClick(Sender: TObject);
    procedure RzToolButton1Click(Sender: TObject);
    procedure RzToolButton3Click(Sender: TObject);
    procedure Image2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ImStockClick(Sender: TObject);
    procedure RzToolButton5Click(Sender: TObject);
    procedure RzToolButton7Click(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure RzToolButton8Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxImage1Click(Sender: TObject);
    procedure cxImage1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cxButton1Click(Sender: TObject);
    procedure AppendLog(path, txt: string);
    procedure OnMinimizeProc(Sender: TObject);
  protected
    procedure ControlWindow(var Msg: TMessage); message WM_SYSCOMMAND;
    procedure IconMouse(var Msg: TMessage); message WM_USER + 1;
  private
    { Dйclarations privйes }
    FImage: TPNGImage;
    procedure WMDropFiles(var Msg: TMessage); message wm_DropFiles;
  public
    { Dйclarations publiques }
    coulProg: array[0..10] of integer; { 0 = цвет для строки 1
                                             1 = цвет для строки 2
                                             2 = цвет для текста строк
                                             3 = Цвет для текста 1
                                             4 = Цвет для текста 2
                                             5 = Цвет для кнопки 1_1
                                             6 = Цвет для кнопки 1_2
                                             7 = Цвет для кнопки
                                             8 = Цвет для кнопки 1
                                             9 = Цвет для кнопки 2
                                             10= Цвет для кнопки 3}
    AffHexa: boolean;
  end;

const
//  Titre des boutons
  titreBtn: array[0..11] of string = ('Выход', 'В буфер', '', '', '', '', '', '', '', '', '', 'Значения по умолчанию');

// Couleurs par dйfaut pour le bouton de la Tform Options
  coulDefaut: array[0..10] of Tcolor = (7519970, 34794, 0,
    12632256, 16777215,
    16777215, 12632256, 0,
    16744448, 12615680, 0);

var
  Form1: TForm1;
  chemin: string;
  cheminsave: string;
  cheminload: string;
  ValRouge: integer;
  ValVert: integer;
  ValBleu: integer;
  selscX: integer;
  mouse: boolean;
  ChromX: Byte;
  ChromY: Byte;
  selX: Byte;
  SelY: Byte;
  ASelX: Byte;
  ASelY: Byte;
  Acolor: array[0..99] of integer;
  Bcolor: array[0..200000] of integer;
  Count: integer; //Количество выбраных цветов
  countcolor: integer;
  A: array[0..99] of Integer;
  bm: TBitmap;
  bm2: TBitmap;
  flagsbrosa: boolean;
  exl_save: Boolean;
  hint1: array[0..63] of Char;

implementation

uses Unit2, Unit3;

{$R *.dfm}
//***************************************


type
  PIntArray = ^TIntArray;
  TIntArray = array[0..0] of Integer;




function DesktopColor(const X, Y: Integer): TColor; // renvoie la couleur sous le curseur de la souris
var
  c: TCanvas;
begin
  c := TCanvas.Create;
  try
    c.Handle := GetWindowDC(GetDesktopWindow);
    Result := GetPixel(c.Handle, X, Y);
  finally
    c.Free;
  end;
end;

//***************************************

procedure TForm1.IconMouse(var Msg: TMessage);
var p: tpoint;
begin
  GetCursorPos(p); // Запоминаем координаты курсора мыши
  case Msg.LParam of // Проверяем какая кнопка была нажата
    WM_LBUTTONUP, WM_LBUTTONDBLCLK: {Действия, выполняемый по одинарному или двойному щелчку левой кнопки мыши на значке. В нашем случае это просто активация приложения}
      begin
        Ic(2, Application.Icon); // Удаляем значок из трея
        ShowWindow(Application.Handle, SW_SHOW); // Восстанавливаем кнопку программы
        ShowWindow(Handle, SW_SHOW); // Восстанавливаем окно программы
      end;
    WM_RBUTTONUP: {Действия, выполняемый по одинарному щелчку правой кнопки мыши}
      begin
        SetForegroundWindow(Handle); // Восстанавливаем программу в качестве переднего окна
        PopupMenu1.Popup(p.X, p.Y); // Заставляем всплыть тот самый TPopUp о котором я говорил чуть раньше
        PostMessage(Handle, WM_NULL, 0, 0);
      end;
  end;
end;

procedure TForm1.ControlWindow(var Msg: TMessage);
begin
  if Msg.WParam = SC_MINIMIZE then
  begin
    Ic(1, Application.Icon); // Добавляем значок в трей
    ShowWindow(Handle, SW_HIDE); // Скрываем программу
    ShowWindow(Application.Handle, SW_HIDE); // Скрываем кнопку с TaskBar'а
  end else inherited;
end;

procedure TForm1.OnMinimizeProc(Sender: TObject);
begin
  PostMessage(Handle, WM_SYSCOMMAND, SC_MINIMIZE, 0);
end;


procedure TForm1.Ic(n: Integer; Icon: TIcon);
var Nim: TNotifyIconData;
  I: integer;
begin
  with Nim do
  begin
    cbSize := SizeOf(Nim);
    Wnd := Form1.Handle;
    uID := 1;
    uFlags := NIF_ICON or NIF_MESSAGE or NIF_TIP;
    hicon := Icon.Handle;
    uCallbackMessage := wm_user + 1;
    for I := 0 to 63 do
      szTip[i] := hint1[i];
  end;
  case n of
    1: Shell_NotifyIcon(Nim_Add, @Nim);
    2: Shell_NotifyIcon(Nim_Delete, @Nim);
    3: Shell_NotifyIcon(Nim_Modify, @Nim);
  end;
end;


procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var c: integer;
  Pos: TPoint;
begin
//##########
// F1 =aide
//if (key=vk_f1) and not (ssCtrl in Shift) then  Application.HelpContext(Hlp_Presentation);
//if (key=vk_f1) and (ssCtrl in Shift) then  Application.HelpContext(Hlp_Touches);


//##########
// la touche insert est appuyйe alors j'affect la couleur a la couleur actuel
  if key = vk_insert then begin
    GetCursorPos(Pos);
    C := DesktopColor(Pos.X, Pos.Y);
    Affiche_Jauge(c);
    ClipBoard.AsText := '$' + intTohex(c, 8);
    if (SSctrl in shift) then begin // la touche CRTL est appuyйe alors j'affect la couleur
      if color_existe(c) then exit; // teste si la couleur est dйja rйfйrencйe
      Acolor[SelX + (SelY * 10)] := c;
      if selection_suivante then messagedlg('Il n''y a plus de cases vides !', mtinformation, [mbok, mbhelp], 0);
      dessine_stock;
    end;

  end;
//##########    touche * du pavй numйrique place le curseur sur la premiere case vide
  if key = VK_MULTIPLY then begin
    Selx := 0;
    Sely := 0;
    selection_suivante;
    dessine_stock;
  end;
//##########    touche Suppr  supprime la couleur sйlectionnй
  if (key = VK_DELETE) and not (ssCtrl in Shift) then
  begin
    ImageBtnEffaceClick(Self); // efface la couleur selectionnйe
    St2.Caption := ''; // efface les valeurs
    St3.Caption := '';
    St4.Caption := '';
    St5.Caption := '';
  end;
  if (key = VK_DELETE) and (ssCtrl in Shift) then ImageBtnNewClick(self);

  if (key = VK_F12) and not (ssCtrl in Shift) then
  begin
    RzToolButton4.Click;
    RzToolButton3.Click;
  end;

  if key in [$60..$6F] then
  begin // Touches du pavй numйrique
//##########   touche plus du pavй numйrique eclaircie la couleur
    if key = vk_add then begin
      inc(valrouge);
      inc(Valvert);
      inc(valBleu);
    end;
//##########   touche Moins du pavй numйrique assombrie la couleur
    if key = VK_SUBTRACT then begin
      dec(valrouge);
      dec(Valvert);
      dec(valBleu);
    end;
//##########   touche 7 du pavй numйrique diminue la variante rouge
    if key = VK_NUMPAD7 then dec(Valrouge);
//##########   touche 9 du pavй numйrique augmente la variante rouge
    if key = VK_NUMPAD9 then inc(Valrouge);
//##########   touche 8 du pavй numйrique centre la variante rouge
    if key = VK_NUMPAD8 then Valrouge := 128;
//##########   touche 7 du pavй numйrique diminue la variante Vert
    if key = VK_NUMPAD4 then dec(ValVert);
//##########   touche 9 du pavй numйrique augmente la variante Vert
    if key = VK_NUMPAD6 then inc(ValVert);
//##########   touche 8 du pavй numйrique centre la variante Vert
    if key = VK_NUMPAD5 then ValVert := 128;
//##########   touche 1 du pavй numйrique diminue la variante Bleu
    if key = VK_NUMPAD1 then dec(ValBleu);
//##########   touche 3 du pavй numйrique augmente la variante Bleu
    if key = VK_NUMPAD3 then inc(ValBleu);
//##########   touche 2 du pavй numйrique centre la variante Bleu
    if key = VK_NUMPAD2 then ValBleu := 128;

    if Valrouge < 0 then Valrouge := 0;
    if ValVert < 0 then ValVert := 0;
    if ValBleu < 0 then ValBleu := 0;
    if Valrouge > 255 then Valrouge := 255;
    if ValVert > 255 then ValVert := 255;
    if ValBleu > 255 then ValBleu := 255;
    affiche_jauge(rgb(valrouge, valvert, valbleu));
  end;

end;

procedure TForm1.FormShow(Sender: TObject);
begin
  exl_save := false;
//  ImRouge.Refresh;
end;

//***************************************

function Tform1.color_existe(c: Tcolor): boolean;
var I: byte;
begin
  result := False;
  for I := 0 to 99 do
    if AColor[i] = c then begin
      result := True;
      exit;
    end;
end;

procedure TForm1.AppendLog(path, txt: string);
var
  F: TextFile;
begin
  if Length(path) = 0 then Exit;
{$I-}
  AssignFile(F, path);
  if FileExists(path) then Append(F)
  else Rewrite(F);
  WriteLn(F, txt);
  CloseFile(F);
{$I+}
end;


procedure TForm1.cxButton1Click(Sender: TObject);
var
  s: string;
  JPEG: TJPEGImage;
begin
  hint1 := '';
  PostMessage(Handle, WM_SYSCOMMAND, SC_MINIMIZE, 0);
  Ic(3, Application.Icon);

  exl_save := true;
  form3.Show;
  form3.hide;
  form3.path_n := cxTextEdit1.Text;
  form3.fl_no_m := true;
  form3.N4.Click;
  image2.Picture.SaveToFile(ExtractFilePath(Application.ExeName) + '/' + cxTextEdit1.Text + '/' + 'original.bmp');

  hint1 := '50%';
  Ic(3, Application.Icon);


  JPEG := TJPEGImage.Create;
  try
   // Bitmap.LoadFromFile('C:\Program Files\Common Files\alarm.bmp');
    JPEG.CompressionQuality := 100;
    JPEG.Assign(image2.Picture.Bitmap);
    JPEG.SaveToFile(ExtractFilePath(Application.ExeName) + '/' + cxTextEdit1.Text + '/' + 'original.jpg');
  finally
    JPEG.Free;
  end;

    JPEG := TJPEGImage.Create;
  try
   // Bitmap.LoadFromFile('C:\Program Files\Common Files\alarm.bmp');
    JPEG.CompressionQuality := 100;
    JPEG.Assign(cxImage1.Picture.Bitmap);
    JPEG.SaveToFile(ExtractFilePath(Application.ExeName) + '/' + cxTextEdit1.Text + '/' + 'in.jpg');
  finally
    JPEG.Free;
  end;

  Excel1.Click;
  exl_save := false;

  if FileExists(ExtractFilePath(Application.ExeName) + '/' + cxTextEdit1.Text + '/' + 'opisanie.txt') then
    DeleteFile(ExtractFilePath(Application.ExeName) + '/' + cxTextEdit1.Text + '/' + 'opisanie.txt');

  s := 'Схема вышивки ' + inttostr(count) + ' нитей, размер ' + inttostr(bm.Width) + 'x' + inttostr(bm.Height) + '. В архиве 5 файлов. ';
  AppendLog(ExtractFilePath(Application.ExeName) + '/' + cxTextEdit1.Text + '/' + 'opisanie.txt', s);
  s := '1-картинка в формате bmp размером ' + inttostr(bm.Width * 15 + 50) + 'x' + inttostr(bm.Height * 15 + 50) + ' px;';
  AppendLog(ExtractFilePath(Application.ExeName) + '/' + cxTextEdit1.Text + '/' + 'opisanie.txt', s);
  s := '2-картинка в формате jpg размером ' + inttostr(bm.Width * 15 + 50) + 'x' + inttostr(bm.Height * 15 + 50) + ' px;';
  AppendLog(ExtractFilePath(Application.ExeName) + '/' + cxTextEdit1.Text + '/' + 'opisanie.txt', s);
  s := '3-документ Excel - где фон клеток имеет соответствующие цвета (файл для распечатки схемы).';
  AppendLog(ExtractFilePath(Application.ExeName) + '/' + cxTextEdit1.Text + '/' + 'opisanie.txt', s);
  s := '4-оригинальное фото';
  AppendLog(ExtractFilePath(Application.ExeName) + '/' + cxTextEdit1.Text + '/' + 'opisanie.txt', s);
  s := '5-Описание';


  hint1 := 'Готово';
  Ic(3, Application.Icon);
end;

procedure TForm1.cxImage1Click(Sender: TObject);
var
  c: integer;
begin
  c := cximage1.Canvas.Canvas.Pixels[Chromx, ChromY];
  Affiche_Jauge(c);
  DrawGradient(ImDegrade.Canvas, ImDegrade.Canvas.ClipRect, True, [clblack, rgb(ValRouge, ValVert, ValBleu), clwhite]);

end;

procedure TForm1.cxImage1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  ChromX := x;
  ChromY := y;
end;

//***************************************

function Tform1.selection_suivante: boolean;
var n: byte;
begin
  n := 0;
  while (n < 100) and (Acolor[SelX + (SelY * 10)] <> -1) do
  begin
    Inc(selx);
    if selx > 9 then begin
      selx := 0;
      inc(sely);
      if sely > 9 then begin
        selx := 0;
        sely := 0;
      end;
    end;
    inc(n);
  end;
  result := (n = 100);
end;

//***************************************

procedure TForm1.Trier_Les_couleurs;
var
  I, J: integer;
  temp: Tcolor;
begin
  for I := 99 downto 1 do
    for J := 0 to (I - 1) do
    begin
      if Acolor[J] < Acolor[J + 1] then begin
        temp := Acolor[J];
        Acolor[J] := Acolor[J + 1];
        Acolor[J + 1] := temp;
      end;
    end;
end;
//***************************************

procedure Tform1.Affiche_Jauge(Couleur: Tcolor);
begin
  PanelCouleur.Color := Couleur;
  ValRouge := getrValue(Couleur);
  Dessine_Jauge(ImRouge, clred, ValRouge, 0);
  ValVert := getgValue(Couleur);
  Dessine_Jauge(ImVert, cllime, ValVert, 1);
  ValBleu := getbValue(Couleur);
  Dessine_Jauge(ImBleu, clblue, ValBleu, 2);
end;

//***************************************

procedure Tform1.DrawGradient(ACanvas: TCanvas; Rect: TRect; Horicontal: Boolean; Colors: array of TColor);
type
  RGBArray = array[0..2] of Byte;
var
  x, y, z, stelle, mx, bis, faColorsh, mass: Integer;
  Faktor: double;
  A: RGBArray;
  B: array of RGBArray;
  merkw: integer;
  merks: TPenStyle;
  merkp: TColor;
begin
  mx := High(Colors);
  if mx > 0 then
  begin
    if Horicontal then
      mass := Rect.Right - Rect.Left
    else
      mass := Rect.Bottom - Rect.Top;
    SetLength(b, mx + 1);
    for x := 0 to mx do
    begin
      Colors[x] := ColorToRGB(Colors[x]);
      b[x][0] := GetRValue(Colors[x]);
      b[x][1] := GetGValue(Colors[x]);
      b[x][2] := GetBValue(Colors[x]);
    end;
    merkw := ACanvas.Pen.Width;
    merks := ACanvas.Pen.Style;
    merkp := ACanvas.Pen.Color;
    ACanvas.Pen.Width := 1;
    ACanvas.Pen.Style := psSolid;
    faColorsh := Round(mass / mx);
    for y := 0 to mx - 1 do
    begin
      if y = mx - 1 then
        bis := mass - y * faColorsh - 1
      else
        bis := faColorsh;
      for x := 0 to bis do
      begin
        Stelle := x + y * faColorsh;
        faktor := x / bis;
        for z := 0 to 3 do
          a[z] := Trunc(b[y][z] + ((b[y + 1][z] - b[y][z]) * Faktor));
        ACanvas.Pen.Color := RGB(a[0], a[1], a[2]);
        if Horicontal then
        begin
          ACanvas.MoveTo(Rect.Left + Stelle, Rect.Top);
          ACanvas.LineTo(Rect.Left + Stelle, Rect.Bottom);
        end
        else
        begin
          ACanvas.MoveTo(Rect.Left, Rect.Top + Stelle);
          ACanvas.LineTo(Rect.Right, Rect.Top + Stelle);
        end;
      end;
    end;
    b := nil;
    ACanvas.Pen.Width := merkw;
    ACanvas.Pen.Style := merks;
    ACanvas.Pen.Color := merkp;
  end
  else
    // Please specify at least two colors
    raise EMathError.Create('Es mussen mindestens zwei Farben angegeben werden.');
end;

procedure TForm1.Excel1Click(Sender: TObject);
const
  xlWBATWorksheet = -4167;
  _WinCode: string[99] =
  ('1234567890!@#$%^&*-+=QWERTYUIOPАБВГДЕЁЖЗИКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзиклмнопрстуфхцчшщъыьэюяЙйЕе№'#32);

var
  Row, Col: Integer;
  GridPrevFile: string;
  XLApp, Sheet, Data: OLEVariant;
  i, j, x, y: Integer;
  k, n: integer;
  m: integer; //номер в позиции
  l: Integer;
  LoopAborted: Boolean;

begin
  RzToolButton3.Enabled := false;
  RzToolButton8.Enabled := false;
  x := bm2.Height;
  y := bm2.Width;
  k := 1;
  n := 1;
  LoopAborted := False;


  XLApp := CreateOleObject('Excel.Application');
  try
     // Hide Excel
    XLApp.Visible := False;
     // Add new Workbook
    XLApp.Workbooks.Add(xlWBatWorkSheet);
    Sheet := XLApp.Workbooks[1].WorkSheets[1];
    Sheet.Name := 'Страница1';


    for j := 1 to y - 1 do
    begin
      cxProgressBar1.Position := round(100 * j / y);

      Application.ProcessMessages;

      if GetKeyState(VK_Escape) and 128 = 128 then
      begin
        LoopAborted := True;
        XLApp.Visible := true;
        RzToolButton3.Enabled := true;
        RzToolButton8.Enabled := true;
        Break;
      end;


      for i := 1 to x - 1 do
      begin



        if i = 1 then Sheet.Columns[j + 3].ColumnWidth := 2.5; //ширина
        if (I = 1) and (j = k) then
        begin
          Sheet.Cells[2, j + 3] := inttostr(j - 1);
          k := k + 5;
        end;

        if (J = 1) and (i = n) then
        begin
          Sheet.Cells[i + 3, 2] := inttostr(i - 1);
          n := n + 5;
        end;

        if true then Sheet.Cells[i + 3, j + 3].Borders.LineStyle := 1;
        Sheet.Cells[i + 3, j + 3].Interior.Color := Bm2.Canvas.Pixels[j, i];

     //Узнаем по цвету номер в позиции
        if true then
          for l := 0 to 99 do
          begin
            if Acolor[l] = Bm2.Canvas.Pixels[j, i] then
              Sheet.Cells[i + 3, j + 3] := inttostr(L);
          end;

      end;
    end;

  //После всего выведем путеводитель

    for l := 0 to 99 do
    begin
      if Acolor[l] <> -1 then
      begin
        Sheet.Cells[x + 8 + l, 4].Borders.LineStyle := 1;
        Sheet.Cells[x + 8 + l, 4] := inttostr(L);
        Sheet.Cells[x + 8 + l, 5].Borders.LineStyle := 1;
        Sheet.Cells[x + 8 + l, 5].Interior.Color := Acolor[l];
      end;
    end;

   //  Sheet.Cells[x+10, 11].Borders.LineStyle := 5;
    Sheet.Cells[x + 10, 11] := 'Программа coleur V2.0 - 2018 г.';
    Sheet.Cells[x + 11, 11] := 'Контакт: admin@elitcomplex.by';



  except
       // Error ?
  end;

  if not exl_save then
    XLApp.Visible := true;

  if exl_save then
  begin

    XLApp.WorkBooks[1].SaveAs(ExtractFilePath(Application.ExeName) + cxTextEdit1.Text + '\' + cxTextEdit1.Text + '_print.xlsx');
 // XLApp.Workbooks[1].SaveAs(ExtractFilePath(Application.ExeName)+'go_print.xls');
 // XLApp.DisplayAlerts := False;
 // XLApp.Workbooks[1].SaveAs('c:/go_print.xls');                            //ExtractFilePath(Application.ExeName)+'/'+cxTextEdit1.Text+'/'+
  end;

  XLApp.ActiveWorkbook.Close;
  XLApp.Application.Quit;

  RzToolButton3.Enabled := true;
  RzToolButton8.Enabled := true;
  cxProgressBar1.Position := 0;
end;


//***************************************

procedure Tform1.Dessine_Btn(Canvas: Tcanvas; glyph: shortint; Text: string; up: boolean);
var vx, vy: integer;
begin
  DrawGradient(Canvas, Canvas.ClipRect, false, [coulprog[5 + (3 * byte(up))], coulprog[6 + (3 * byte(up))]]);
  with Canvas do
  begin
    pen.Color := clblack;
    pen.width := 1;
    Brush.Style := BsClear;
    rectangle(cliprect); // trace une simple bordure sur le bouton
    if text <> '' then begin
      font.Color := coulprog[7 + (3 * byte(up))]; // couleur du texte du bouton
      Vx := (Canvas.ClipRect.Right - canvas.TextWidth(text) + 20) shr 1;
      vy := (canvas.ClipRect.Bottom - canvas.TextHeight(text)) shr 1;
      TextOut(byte(up) + Vx, byte(up) + vy, text);
      dec(vx, 20);
    end else vx := (Canvas.ClipRect.Right - 16) shr 1;


    if glyph > -1 then begin
      vy := (canvas.ClipRect.Bottom - 16) shr 1; // centre horizontalement le glyph
      imagelist1.Draw(Canvas, byte(up) + Vx, byte(up) + vy, Glyph, true); // affiche le glyph
                                                                             // Byte(Up)+ Permet de dйcaler d'un pixel le glyph
    end;
  end;
end;

//***************************************

procedure Tform1.Sauve_ini;
var
  MyIniFile: TIniFile;
  i: Byte;
begin
  MyIniFile := TIniFile.Create(chemin + 'application.ini');

  MyIniFile.WriteString('Chemin', 'Save', cheminSave);
  MyIniFile.WriteString('Chemin', 'Load', cheminLoad);

  MyIniFile.WriteBool('Options', 'AffHexa', AffHexa);

  MyIniFile.WriteInteger('Valeur', 'Rouge', ValRouge);
  MyIniFile.WriteInteger('Valeur', 'Vert', ValVert);
  MyIniFile.WriteInteger('Valeur', 'Bleu', ValBleu);
  MyIniFile.WriteString('Dialog', 'Dir', RzOpenDialog1.FileName);

  if True then


    for i := 0 to 99 do
      MyIniFile.Writeinteger('CouleurStock', inttostr(i), Acolor[I]);

  for i := 0 to 15 do // sauvegarde des couleurs customisable du Tdialogcolor
    MyIniFile.WriteString('CouleurCustom', char(65 + i), colordialog1.CustomColors.Strings[i]);

  for i := 0 to 10 do // sauve garde de vos couleurs du programme
    MyIniFile.Writeinteger('CouleurProg', inttostr(I), coulProg[i]);

  MyIniFile.Free;
end;

//***************************************

procedure Tform1.charge_ini;
var
  MyIniFile: TIniFile;
  I: byte;
begin
  MyIniFile := TIniFile.Create(chemin + 'application.ini');

  cheminSave := MyIniFile.readString('Chemin', 'Save', chemin);
  cheminLoad := MyIniFile.ReadString('Chemin', 'Load', chemin);

  AffHexa := MyIniFile.ReadBool('Options', 'AffHexa', true);
  ValRouge := MyIniFile.ReadInteger('Valeur', 'Rouge', 0);
  ValVert := MyIniFile.ReadInteger('Valeur', 'Vert', 0);
  ValBleu := MyIniFile.ReadInteger('Valeur', 'Bleu', 0);
  RzOpenDialog1.FileName := MyIniFile.ReadString('Dialog', 'Dir', 'C:/');


  for I := 0 to 99 do
    Acolor[i] := MyIniFile.Readinteger('CouleurStock', inttostr(I), -1);

  for i := 0 to 15 do
    ColorDialog1.CustomColors.Add(MyIniFile.ReadString('CouleurCustom', char(65 + i), 'Color' + chr(65 + i) + '=0'));

  for i := 0 to 10 do
    coulProg[i] := MyIniFile.Readinteger('CouleurProg', inttostr(I), CoulDefaut[i]);


  MyIniFile.Free;
end;
//***************************************

procedure Tform1.Dessine_Stock;
var x, y: byte;
begin
  for x := 0 to 9 do
    for y := 0 to 9 do
      with ImStock.Canvas do

      begin
        pen.Color := clblack;
        if Acolor[x + (y * 10)] = -1 then begin // couleur non affectuйe
          brush.Style := bsSolid;
          brush.Color := clWhite;
          rectangle(25 * x, 25 * y, 26 + (25 * x), 26 + 25 * y); // efface le case
          brush.Color := clbtnface;
          brush.Style := bsDiagCross; // dessine des Lignes en diagonale
        end
        else begin
          brush.Color := Acolor[x + (y * 10)]; // couleur non affectuйe
          brush.Style := bsSolid;
        end;
        rectangle(25 * x, 25 * y, 26 + (25 * x), 26 + 25 * y); // trace le rectangle

        if (selx = x) and (SelY = y) then begin // si la case est sйlectionnйe
          pen.Width := 3; // dessine une crois avec trois pixels d'epaisseur en noir
          moveto(25 * x, 25 * y);
          Lineto(26 + (25 * x), 26 + 25 * y);
          moveto(26 + 25 * x, 25 * y);
          Lineto(25 * x, 26 + 25 * y);
          pen.Width := 1; // dessine une crois avec 1 pixels d'epaisseur en blanc pour une
          pen.Color := clwhite; // meilleur visibitйe sur des cases sombres
          moveto(25 * x, 25 * y);
          Lineto(26 + (25 * x), 26 + 25 * y);
          moveto(26 + 25 * x, 25 * y);
          Lineto(25 * x, 26 + 25 * y);
        end;
      end;
end;

//***************************************

procedure Tform1.Dessine_Jauge(im: Timage; couleur: Tcolor; Valeur: Integer; RegCol: byte);
var x: integer;
begin
  with im.Canvas do
  begin
    pen.Color := clBlack;
    Brush.Color := ClbtnFace;
    Rectangle(Cliprect); // efface tous l'image
  end;
  DrawGradient(Im.Canvas, // Dessine le dйgradй du noir vers la couleur
    rect(5, 10, 261, 25),
    true,
    [clblack, Couleur]);
  with im.Canvas do // dessine les curseurs
  begin
    pen.Color := clBlack;
    for x := 0 to 5 do
    begin
      moveto(5 + Valeur - x, 10 - x);
      lineto(5 + Valeur + x, 10 - x);
    end;
    for x := 0 to 5 do
    begin
      moveto(5 + Valeur - x, 25 + x);
      lineto(5 + Valeur + x, 25 + x);
    end;
    case Regcol of // selectionne seulement la valeur de la couleur
      0: Brush.Color := RGB(Valeur, 0, 0);
      1: Brush.Color := RGB(0, valeur, 0);
      2: Brush.Color := RGB(0, 0, valeur);
    end;
    Rectangle(270, 10, 285, 25);
    Font.Style := [fsBold];
    Brush.Color := clbtnFace;
    if AffHexa then textout(290, 12, '$' + inttohex(Valeur, 2))
    else textout(290, 12, inttostr(Valeur))
  end;
end;

//***************************************

procedure tform1.dessine_titre(canvas: Tcanvas; Text, soustitre: string);
var x: integer;
begin
  DrawGradient(Canvas, Canvas.ClipRect, false, [CoulProg[0], CoulProg[1]]);
  with Canvas do
  begin
    brush.Style := BsClear;
    Font.Color := CoulProg[2];
    font.Style := [fsBold];
    Font.Size := 12;
    TextOut(10, 3, Text);
    x := 20 + textwidth(text);
    font.Style := [];
    Font.Size := 8;
    TextOut(x, 8, Soustitre);
    rectangle(cliprect);
  end;
end;

//***************************************

procedure Tform1.actualise;
begin
  DEssine_titre(imagetitre.canvas, 'Rakel V2.0 ', '');

  DrawGradient(ImageFond.Canvas, ImageFond.Canvas.ClipRect, false, [CoulProg[3], CoulProg[4]]); // dessine le fond de la fiche

  with ImageFond.Canvas do
  begin // dessine la bordure
    pen.width := 2;
    brush.Style := BsClear;
    pen.Color := clblack;
    rectangle(cliprect);
  end;

 // dessine_btn(ImageBtnQuitter.Canvas, 0, titrebtn[0], False); // dessine tous les boutons de la fiche
 // dessine_btn(ImageBtnClipboard.Canvas, 1, titrebtn[1], False);
  dessine_btn(ImageBtnEclaircir.Canvas, 2, '', False);
  dessine_btn(ImageBtnAssombrire.Canvas, 3, '', False);
  dessine_btn(ImageBtnSave.Canvas, 4, '', False);
  dessine_btn(ImageBtnLoad.Canvas, 5, '', False);
  dessine_btn(ImageBtnNew.Canvas, 6, '', False);
  dessine_btn(ImageBtnEfface.Canvas, 7, '', False);
  dessine_btn(ImageBtnAjoute.Canvas, 8, '', False);
  dessine_btn(ImageBtnExtraire.Canvas, 9, '', False);
  dessine_btn(ImageBtnCompact.Canvas, 10, '', False);
  dessine_btn(ImageBtnTrier.Canvas, 14, '', False);
end;

//***************************************

procedure TForm1.FormCreate(Sender: TObject);
begin
  Application.onMinimize := OnMinimizeProc;
  DragAcceptFiles(Handle, true);
  chemin := extractfilepath(application.ExeName); // extrait le chemin de l'application
  charge_ini;

  SelX := 0;
  SelY := 0;
  doubleBuffered := True;
  Mouse := false;

  Affiche_jauge(rgb(Valrouge, ValVert, ValBleu));

  DrawGradient(ImDegrade.Canvas, ImDegrade.Canvas.ClipRect, True, [clblack, rgb(ValRouge, ValVert, ValBleu), clwhite]);

  Dessine_Stock;

  actualise;

  bm := TBitmap.Create;
  bm2 := TBitmap.Create;

end;

//***************************************

procedure TForm1.WMDropFiles(var Msg: TMessage);
var
  FileName: array[0..256] of char;
  bmp: TBItmap;
  jpg: TJpegImage;
begin
  DragQueryFile(THandle(Msg.WParam), 0, FileName, SizeOf(Filename));
  cximage1.Picture.LoadFromFile(FileName);

  if cximage1.Picture.Graphic is TJPEGImage then
  begin
    jpg := TJpegImage.Create;
    try
      jpg.Loadfromfile(FileName);
      bmp := Tbitmap.Create;

      bmp.Width := jpg.Width;
      bmp.Height := jpg.Height;
      bmp.Canvas.StretchDraw(bmp.Canvas.Cliprect, jpg);
      cximage1.Picture.Bitmap := bmp;

    finally

    end;
  end;

  RzStatusPane1.Caption := inttostr(cximage1.Picture.Bitmap.Width) +
    ' x ' + inttostr(cximage1.Picture.Bitmap.Height);

 // RzToolButton5.Enabled := true;
 // TrackBar1.Enabled := true;
  //RzToolButton2.Enabled := true;
 // RzToolButton3.Enabled := true;
 // RzToolButton6.Enabled := true;
 // RzToolButton8.Enabled := true;

  DragFinish(THandle(Msg.WParam));
end;




procedure TForm1.FormDestroy(Sender: TObject);
begin
  sauve_ini;
end;

//***************************************

procedure Tform1.charge_fichier(nom: string);
var F: textfile;
  lig: string;
  i: integer;
begin
  if fileexists(nom) then
    assignfile(F, Nom);
  reset(F);
  for I := 0 to 99 do begin
    Readln(F, lig); // ici pas le choix;
    Acolor[i] := strtoint(lig);
  end;
  closefile(F);

end;

//***************************************

procedure Tform1.sauve_fichier(nom: string);
var F: textfile;
  lig: string;
  i: integer;
begin
  changefileext(nom, '.COL');
  assignfile(F, Nom);
  rewrite(F);
  for I := 0 to 99 do begin
    lig := inttostr(Acolor[i]);
    writeln(F, lig) // ici pas le choix;
  end;
  closefile(F);
end;
//***************************************

procedure TForm1.ImJaugeMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (x > 1) and (y > 1) and (x < 270) and (y < 35) then
  begin
    Mouse := true;
    case (sender as Timage).Tag of
      0: begin
          ValRouge := x - 2;
          if ValRouge < 0 then ValRouge := 0 else if ValRouge > 255 then ValRouge := 255;
          Dessine_Jauge(ImRouge, clred, ValRouge, 0);
        end;
      1: begin

          ValVert := x - 2;
          if ValVert < 0 then ValVert := 0 else if ValVert > 255 then ValVert := 255;
          Dessine_Jauge(ImVert, clLime, ValVert, 1);
        end;
      2: begin
          ValBleu := x - 2;
          if ValBleu < 0 then ValBleu := 0 else if ValBleu > 255 then ValBleu := 255;
          Dessine_Jauge(ImBleu, clblue, ValBleu, 2);
        end;
    end;
  end;
  PanelCouleur.Color := rgb(ValRouge, ValVert, ValBleu);
end;

//***************************************

procedure TForm1.ImJaugeMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  DrawGradient(ImDegrade.Canvas, ImDegrade.Canvas.ClipRect, True, [clblack, rgb(ValRouge, ValVert, ValBleu), clwhite]);
  Mouse := False;
end;

//***************************************

procedure TForm1.ImJaugeMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if mouse then
    if (x > 1) and (y > 1) and (x < 270) and (y < 35) then
    begin
      case (sender as Timage).Tag of
        0: begin
            ValRouge := x - 2;
            if ValRouge < 0 then ValRouge := 0 else if ValRouge > 255 then ValRouge := 255;
            Dessine_Jauge(ImRouge, clred, ValRouge, 0);
          end;
        1: begin
            ValVert := x - 2;
            if ValVert < 0 then ValVert := 0 else if ValVert > 255 then ValVert := 255;
            Dessine_Jauge(ImVert, clLime, ValVert, 1);
          end;
        2: begin
            ValBleu := x - 2;
            if ValBleu < 0 then ValBleu := 0 else if ValBleu > 255 then ValBleu := 255;
            Dessine_Jauge(ImBleu, clblue, ValBleu, 2);
          end;
      end;
    end;
  PanelCouleur.Color := rgb(ValRouge, ValVert, ValBleu);
end;

//***************************************

procedure TForm1.ImStockDBClick(Sender: TObject);
begin
end;

//***************************************

procedure TForm1.ImStockMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var I: integer;
begin
  I := (x div 25) + (10 * (y div 25));
  St1.Caption := inttostr(i);
  if Acolor[I] = -1
    then begin
    St2.Caption := '';
    St3.Caption := '';
    St4.Caption := '';
    St5.Caption := '';
  end else
  begin
    if AffHexa then
    begin
      St2.Caption := '$' + IntToHex(Acolor[I], 8); // affiche en hйxadйcimale
      St3.Caption := '$' + IntToHex(getRvalue(Acolor[I]), 2);
      St4.Caption := '$' + IntToHex(getGvalue(Acolor[I]), 2);
      St5.Caption := '$' + IntToHex(getBvalue(Acolor[I]), 2);
    end else begin
      St2.Caption := inttostr(Acolor[I]); // affiche en dйcimale
      St3.Caption := inttostr(getRvalue(Acolor[I]));
      St4.Caption := inttostr(getGvalue(Acolor[I]));
      St5.Caption := inttostr(getBvalue(Acolor[I]));
    end;
  end;
end;

procedure TForm1.ImStockMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  selx := x div 25;
  SelY := Y div 25;
  Dessine_Stock;
  ASelX := selX;
  ASelY := SelY;
end;

//***************************************

procedure TForm1.ImStockMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var Sx, SY: byte;
  t: integer;
begin
  sx := x div 25;
  SY := Y div 25;
  if (ASelX <> sX) or (ASelY <> SY) then // echange la place de deux couleurs
  begin
    t := Acolor[sx + (10 * sy)];
    Acolor[sx + (10 * sy)] := AColor[aselX + (10 * aselY)];
    AColor[aselX + (10 * aselY)] := t;
  end;
  Dessine_Stock;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
  form3.Show;
  form3.fl_no_m := false;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  ClipBoard.AsText := '$' + intTohex(RGB(ValRouge, ValVert, ValBleu), 8);
end;

procedure TForm1.N4Click(Sender: TObject);
begin
  if color_existe(PanelCouleur.Color) then
  begin
    messagedlg('Такой цвет уже есть в выборке !', mtinformation, [mbok], 0);
    exit;
  end;
  Acolor[SelX + (SelY * 10)] := PanelCouleur.Color;
  if selection_suivante then messagedlg('Цвет будет добавлен !', mtConfirmation, [mbok, mbNo], 0);
  dessine_stock;

end;

procedure TForm1.N6Click(Sender: TObject);
begin
  if RzSaveDialog1.Execute then
  begin
    image2.Picture.SaveToFile(RzSaveDialog1.FileName);
    showmessage('Файл сохранен в папке программы под именем "' + RzSaveDialog1.FileName + '"');

  end;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
  if RzOpenDialog2.Execute then
  begin
    image2.Picture.LoadFromFile(RzOpenDialog2.FileName);
  end;

end;

//***************************************

procedure TForm1.ImageBtnIconeDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  (Sender as Timage).Top := (Sender as Timage).Top + 1;
  (Sender as Timage).Left := (Sender as Timage).Left + 1;
end;

//***************************************

procedure TForm1.ImageBtnIconeUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  (Sender as Timage).Top := (Sender as Timage).Top - 1;
  (Sender as Timage).Left := (Sender as Timage).Left - 1;
end;

//***************************************

procedure TForm1.ImageBtnMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  dessine_btn((sender as Timage).Canvas, (sender as Timage).Tag, TitreBtn[(sender as Timage).tag], true);
end;

//***************************************

procedure TForm1.ImageBtnMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  dessine_btn((sender as Timage).Canvas, (sender as Timage).Tag, TitreBtn[(sender as Timage).tag], False);
end;

//***************************************

procedure TForm1.ImageTitreMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture; // dйplace la fenкtre avec la souris
  SendMessage(Form1.Handle, wm_SysCommand, $F012, 0);
end;

//***************************************

procedure TForm1.ImageChromMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  ChromX := x;
  ChromY := y;
end;

//***************************************

procedure TForm1.ImageChromClick(Sender: TObject);
begin
  Affiche_Jauge(imagechrom.Canvas.Pixels[Chromx, ChromY]);
  DrawGradient(ImDegrade.Canvas, ImDegrade.Canvas.ClipRect, True, [clblack, rgb(ValRouge, ValVert, ValBleu), clwhite]);
end;

//***************************************

procedure TForm1.ImDegradeMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  selscX := X;
end;

//***************************************

procedure TForm1.ImDegradeClick(Sender: TObject);
begin
  Affiche_Jauge(imDegrade.Canvas.Pixels[SelSCX, 5]);
end;

//***************************************

procedure TForm1.PanelcouleurDblClick(Sender: TObject);
begin
  if color_existe(PanelCouleur.Color) then
  begin
    messagedlg('Такой цвет уже есть в выборке !', mtinformation, [mbok], 0);
    exit;
  end;
  Acolor[SelX + (SelY * 10)] := PanelCouleur.Color;
  if selection_suivante then messagedlg('Цвет будет добавлен !', mtConfirmation, [mbok, mbNo], 0);
  dessine_stock;

end;

//#######################################

//***************************************

procedure TForm1.ImageBtnAideClick(Sender: TObject);
begin
end;
//***************************************

procedure TForm1.ImageBtnAssombrireClick(Sender: TObject);
begin
  dec(ValRouge, 10);
  if ValRouge < 0 then ValRouge := 0;
  dec(ValVert, 10);
  if ValVert < 0 then ValVert := 0;
  dec(ValBleu, 10);
  if ValBleu < 0 then ValBleu := 0;
  Affiche_Jauge(rgb(ValRouge, ValVert, ValBleu));

end;

//***************************************

procedure TForm1.ImageBtnClipBoardClick(Sender: TObject);
begin
end;

//***************************************

procedure TForm1.ImageBtnCompactClick(Sender: TObject);
var X: Shortint;
begin
  x := -1;
  while (x < 99) do
  begin
    if (Acolor[x] = -1) and (Acolor[succ(x)] <> -1) then
    begin
      Acolor[x] := Acolor[succ(x)];
      Acolor[succ(x)] := -1;
      x := 0;
    end;
    inc(x);
  end;
  if (Acolor[0] = -1) and (Acolor[1] <> -1) then ImageBtnCompactClick(self);
  selection_suivante;
  dessine_Stock;
end;

//***************************************

procedure TForm1.ImageBtnEclaircirClick(Sender: TObject);
begin
  inc(ValRouge, 10);
  if ValRouge > 255 then ValRouge := 255;
  inc(ValVert, 10);
  if ValVert > 255 then ValVert := 255;
  inc(ValBleu, 10);
  if ValBleu > 255 then ValBleu := 255;
  Affiche_Jauge(rgb(ValRouge, ValVert, ValBleu));
end;

//***************************************

procedure TForm1.ImageBtnEffaceClick(Sender: TObject);
begin
  Acolor[SelX + (SelY * 10)] := -1;
  dessine_stock;
end;

//***************************************

procedure TForm1.ImageBtnLoadClick(Sender: TObject);
begin
  opendialog1.InitialDir := cheminload;
  if openDialog1.Execute then begin
    cheminload := extractfilepath(opendialog1.FileName);
    charge_fichier(opendialog1.FileName);
    dessine_stock;
    Dessine_titre(ImageTitre.Canvas, 'Couleur', '( ' + changefileext(extractfilename(opendialog1.FileName), '') + ' )');
  end;
end;

//***************************************

procedure TForm1.ImageBtnMiniClick(Sender: TObject);
begin
  //application.Minimize;
  PostMessage(Handle, WM_SYSCOMMAND, SC_MINIMIZE, 0);
end;

//***************************************

procedure TForm1.ImageBtnNewClick(Sender: TObject);
var i: byte;
begin
  if messagedlg('Очистить палитру ?', Mtconfirmation, [mbyes, mbno], 0) = mrno then exit;
  for i := 0 to 99 do Acolor[I] := -1;
  selx := 0;
  sely := 0;
  dessine_stock;
  ImStockMouseMove(self, [], 0, 0);
end;

//***************************************

procedure TForm1.ImageBtnOptionsClick(Sender: TObject);
begin
  form1.Hide;
  form2.actualise;
  form2.showmodal;
  form1.Show;
end;

//***************************************

procedure TForm1.ImageBtnQuitterClick(Sender: TObject);
begin
  Close;
end;

//***************************************

procedure TForm1.ImageBtnSaveClick(Sender: TObject);
begin
  savedialog1.InitialDir := cheminSave;
  if saveDialog1.Execute then begin
    cheminSave := extractfilepath(savedialog1.FileName);
    sauve_fichier(changefileext(savedialog1.FileName, '.COL'));
    Dessine_titre(ImageTitre.Canvas, 'Rakel V2.0', '( ' + extractfilename(savedialog1.FileName) + ' )');
  end;
end;

//***************************************


procedure TForm1.ImageBtnTrierClick(Sender: TObject);
begin
  Trier_Les_couleurs;
  dessine_stock;
end;

procedure CreatePremultipliedBitmap(DstBitMap: TBitmap; SrcPngImage: TPNGImage);
type
  TRGBTripleArray = array[Word] of TRGBTriple;
  pRGBTripleArray = ^TRGBTripleArray;
  TRGBAArray = array[Word] of TRGBQuad;
  PRGBAArray = ^TRGBAArray;
var
  x, y: Integer;
  TripleAlpha: Double;
  pColor: pRGBTripleArray;
  pAlpha: pbytearray;
  pBmp: pRGBAArray;
begin
  DstBitMap.Height := SrcPngImage.Height;
  DstBitMap.Width := SrcPngImage.Width;
  DstBitMap.PixelFormat := pf32bit;
  for y := 0 to SrcPngImage.Height - 1 do
  begin
    pAlpha := SrcPngImage.AlphaScanline[y];
    pColor := SrcPngImage.Scanline[y];
    pBmp := DstBitMap.ScanLine[y];
    for x := 0 to SrcPngImage.Width - 1 do
    begin
      pBmp[x].rgbReserved := pAlpha[x];
        // преобразуем в нужный формат
      TripleAlpha := pBmp[x].rgbReserved / 255;
      pBmp[x].rgbBlue := byte(trunc(pColor[x].rgbtBlue * TripleAlpha));
      pBmp[x].rgbGreen := byte(trunc(pColor[x].rgbtGreen * TripleAlpha));
      pBmp[x].rgbRed := byte(trunc(pColor[x].rgbtRed * TripleAlpha));
    end;
  end;
end;


procedure TForm1.RzToolButton1Click(Sender: TObject);
var
  bmp: TBItmap;
  jpg: TJpegImage;
  png: TPngImage;
  gif: TGIFImage;
  bf: TBlendFunction;
begin
  if RzOpenDialog1.Execute then
  begin
    cxTextEdit1.Text := StringReplace(ExtractFileName(RzOpenDialog1.FileName), ExtractFileExt(RzOpenDialog1.FileName), '', []);
    cximage1.Picture.LoadFromFile(RzOpenDialog1.FileName);

    if pos('.jpg', RzOpenDialog1.FileName) > 0 then
    begin
      jpg := TJpegImage.Create;
      try
        jpg.Loadfromfile(RzOpenDialog1.FileName);
        bmp := Tbitmap.Create;

        bmp.Width := jpg.Width;
        bmp.Height := jpg.Height;
        bmp.Canvas.StretchDraw(bmp.Canvas.Cliprect, jpg);
        cximage1.Picture.Bitmap := bmp;

      finally
        jpg.Free;
      end;
    end;


    if pos('.gif', RzOpenDialog1.FileName) > 0 then
    begin
      gif := TGIFImage.Create;
      try
        gif.Loadfromfile(RzOpenDialog1.FileName);
        bmp := Tbitmap.Create;

        bmp.Width := gif.Width;
        bmp.Height := gif.Height;
        bmp.Canvas.StretchDraw(bmp.Canvas.Cliprect, gif);
        cximage1.Picture.Bitmap := bmp;

      finally
        jpg.Free;
      end;
    end;


    if pos('.png', RzOpenDialog1.FileName) > 0 then
    begin
      FImage := TPNGImage.Create;
      png := TPngImage.Create;
      try
        png.Loadfromfile(RzOpenDialog1.FileName);
      // png.TransparentColor := clWhite;
        png.Canvas.Brush.Color := RGB(255, 255, 255); // нужный цвет
        bmp := Tbitmap.Create;
        CreatePremultipliedBitmap(bmp, FImage);

        with bf do
        begin
          BlendOp := AC_SRC_OVER;
          BlendFlags := 0;
          AlphaFormat := AC_SRC_ALPHA;
          SourceConstantAlpha := 255;
        end;
        //bmp.PixelFormat := pf32bit;
        bmp.Width := png.Width;
        bmp.Height := png.Height;

        bmp.Canvas.StretchDraw(bmp.Canvas.Cliprect, png);
        bmp.TransparentColor := clWhite;
        cximage1.Picture.Bitmap := bmp;

      finally
        png.Free;
        FImage.Free;
      end;
    end;

    RzStatusPane1.Caption := inttostr(cximage1.Picture.Bitmap.Width) +
      ' x ' + inttostr(cximage1.Picture.Bitmap.Height);

    RzToolButton7.Enabled := true;
    TrackBar1.Enabled := true;
    RzToolButton4.Enabled := true;
    RzToolButton5.Enabled := true;



  end;
end;

procedure QuickSort(IntArray: PIntArray; Low, High: Integer);

  procedure Swap(Index1, Index2: Integer);
  var
    N: Integer;
  begin
    N := IntArray[Index1];
    IntArray[Index1] := IntArray[Index2];
    IntArray[Index2] := N;
  end;

var
  Mid: Integer;
  Item: Integer;
  ScanUp, ScanDown: Integer;
begin
  // Здесь реализована сортировка по убыванию
  // Для реализации по возрастанию замените операции
  // сравнения на приведённые в комментариях
  if High - Low <= 0 then
    exit;
  if High - Low = 1 then
  begin
    if IntArray[High] {<} > IntArray[Low] then
      Swap(Low, High);
    Exit;
  end;
  Mid := (High + Low) shr 1;
  Item := IntArray[Mid];
  Swap(Mid, Low);
  ScanUp := Low + 1;
  ScanDown := High;
  repeat
    while (ScanUp <= ScanDown) and (IntArray[ScanUp] {<=} >= Item) do
      Inc(ScanUp);
    while (IntArray[ScanDown] {>} < Item) do
      Dec(ScanDown);
    if (ScanUp < ScanDown) then
      Swap(ScanUp, ScanDown);
  until (ScanUp >= ScanDown);
  IntArray[Low] := IntArray[ScanDown];
  IntArray[ScanDown] := Item;
  if (Low < ScanDown - 1) then
    QuickSort(IntArray, Low, ScanDown - 1);
  if (ScanDown + 1 < High) then
    QuickSort(IntArray, ScanDown + 1, High);
end;


function pixelSel(N: integer): integer; //Входной параметр пиксел и выходной (цвет)
var
  I: integer;
  D: integer;
begin
  D := 0;
    // for i := 0 to count do
    //Сначала пределы
  if N >= A[0] then
  begin
    result := A[0];
    exit;
  end;

  if N <= A[count - 1] then
  begin
    result := A[count - 1];
    exit;
  end;

     // result:=0;
    //if N<A[0] then D:=0;

  for I := 0 to count - 1 do
  begin
    if (A[I] >= N) and (N > A[I + 1]) then
    begin
      if (A[I] - N) > (N - A[I + 1]) then
        D := A[I + 1]
      else
        if (A[I] - N) < (N - A[I + 1]) then
          D := A[I] else
          if (A[I] - N) = (N - A[I + 1]) then
            D := A[I];
    end;
  end;
  result := D;
end;



procedure TForm1.RzToolButton3Click(Sender: TObject);
var
  i, j: integer; //Размеры картинки
  x, y: integer; //Координаты
  s: string;
begin
  ImageBtnCompact.OnClick(Self);
  ImageBtnTrier.OnClick(Self);

//Подготовим атмосферу
  flagsbrosa := false;
  Count := 0;

  for I := 0 to 99 - 1 do
  begin
    if Acolor[I] <> -1 then
    begin
      A[I] := Acolor[I];
      count := count + 1;
    end;
  end;

//Посортируем палитру
  QuickSort(@A, 0, count);



  bm.Assign(cximage1.Picture);
  x := bm.Height;
  y := bm.Width;


  bm2.Height := bm.Height;
  bm2.Width := bm.Width;

  for j := 1 to y do
  begin
    cxProgressBar1.Position := round(100 * j / y);
    for i := 1 to x do
    begin
      Bm2.Canvas.Pixels[j, i] := pixelSel(Bm.Canvas.Pixels[j, i]);

    end;
  end;

  image2.Picture.Assign(bm2);
  cxProgressBar1.Position := 0;
end;


procedure TForm1.RzToolButton5Click(Sender: TObject);
var
  I, j: integer;
  x, y: integer;
  flag: boolean;
  r: byte;
begin

  for r := 0 to 99 do Acolor[r] := -1;
  selx := 0;
  sely := 0;
  dessine_stock;
  ImStockMouseMove(self, [], 0, 0);


  bm.Assign(cximage1.Picture);
  x := bm.Height;
  y := bm.Width;
  countcolor := 0;
  count := 0;

  for j := 1 to x do
  begin
    for i := 1 to y do
    begin
      if countcolor < 5000 then
      begin
        Bcolor[countcolor] := Bm.Canvas.Pixels[random(x), random(y)];
        countcolor := countcolor + 1;
      end;
    end;
  end;

  QuickSort(@Bcolor, 0, countcolor);
  for i := 0 to countcolor - 5 do
  begin
    if Bcolor[i] = Bcolor[i + TrackBar1.Position] then
    begin
       //Проверка на уже существующие

      flag := false;

      for j := 0 to 99 - 1 do
      begin
        if Bcolor[i] = Acolor[j] then
          flag := true;
      end;

      if flag = false then
      begin
        Acolor[count] := Bcolor[i];
        count := count + 1;
      end;
    end;
  end;
  ImageBtnCompact.OnClick(Sender);
end;





function RefToCell(ARow, ACol: Integer): string;
begin
  Result := Chr(Ord('A') + ACol - 1) + IntToStr(ARow);
end;





procedure TForm1.RzToolButton7Click(Sender: TObject);
var
  bmp: TBItmap;
  jpg: TJpegImage;
  scale: Double;
  s: string;
begin

  s := '100';
  if InputQuery('Маштабирование',
    'Введите, пожалуйста, наибольшую сторону для изображения:', s)
    then
  begin

    jpg := TJpegImage.Create;
    try
      jpg.Assign(cximage1.Picture.Bitmap);
      if jpg.Height > jpg.Width then
        scale := strtoint(s) / jpg.Height
      else
        scale := strtoint(s) / jpg.Width;
      bmp := Tbitmap.Create;
      try
        bmp.Width := Round(jpg.Width * scale);
        bmp.Height := Round(jpg.Height * scale);
        bmp.Canvas.StretchDraw(bmp.Canvas.Cliprect, jpg);
        cximage1.Picture.Bitmap := bmp;
        RzStatusPane1.Caption := inttostr(cximage1.Picture.Bitmap.Width) +
          ' x ' + inttostr(cximage1.Picture.Bitmap.Height);

      finally
        bmp.free;
      end;
    finally
    end;
  end;
end;

procedure TForm1.RzToolButton8Click(Sender: TObject);
var
  i, j: integer; //Размеры картинки
  x, y: integer; //Координаты
  s: string;
begin
//Подготовим атмосферу
  Count := 0;


  bm.Assign(cximage1.Picture);
  x := bm.Height;
  y := bm.Width;

  bm2.Height := bm.Height;
  bm2.Width := bm.Width;

  for j := 1 to y do
  begin
    cxProgressBar1.Position := round(100 * j / y);
    for i := 1 to x do
    begin
      Bm2.Canvas.Pixels[j, i] := Bm.Canvas.Pixels[j, i];
    end;
  end;

  image2.Picture.Assign(bm2);
  cxProgressBar1.Position := 0;
end;

procedure TForm1.Image1Click(Sender: TObject);
var
  c: integer;
begin
  c := cximage1.Canvas.Canvas.Pixels[Chromx, ChromY];
  Affiche_Jauge(c);
  DrawGradient(ImDegrade.Canvas, ImDegrade.Canvas.ClipRect, True, [clblack, rgb(ValRouge, ValVert, ValBleu), clwhite]);
end;

procedure TForm1.Image1DblClick(Sender: TObject);
begin
  if cximage1.Properties.Proportional then cximage1.Properties.Proportional := false else
    cximage1.Properties.Proportional := true;
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  ChromX := x;
  ChromY := y;

end;

procedure TForm1.Image2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  image2.Hint := inttostr(Bm.Canvas.Pixels[X, Y]);
end;

procedure TForm1.Image3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  ChromX := x;
  ChromY := y;

end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  bm.free;
  bm2.free;
end;

procedure TForm1.ImStockClick(Sender: TObject);
begin
  if Acolor[SelX + (SelY * 10)] = -1 then
  begin
    imStocK.Hint := '';
    exit;
  end;
  imStocK.Hint := inttostr(Acolor[SelX + (SelY * 10)]);

  if Acolor[SelX + (SelY * 10)] = -1 then exit; // si la couleur sйlectionnйe est vide alors en quitte
  Affiche_Jauge(Acolor[SelX + (SelY * 10)]); // affecte und couleur en stock a la couleur actuel
  DrawGradient(ImDegrade.Canvas, ImDegrade.Canvas.ClipRect, true, [clblack, rgb(ValRouge, ValVert, ValBleu), clwhite]);

end;

procedure TForm1.Image2Click(Sender: TObject);
begin
  if Image2.Proportional then Image2.Proportional := false else
    Image2.Proportional := true;
end;

end.

