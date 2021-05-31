unit Uprincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sMemo, DLMemo, ExtCtrls, DelphiUp;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    Button1: TButton;
    Edit1: TEdit;
    Button2: TButton;
    DLMemo1: TDLMemo;
    Button3: TButton;
    Button4: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    arq : TextFile;
    x: TStringList;
    adc: boolean;
    function TokenN(const aTokenList:string; aIndex:integer; aTokenSeparator:char=' '):string;
    function ValueOf(const aValue:string):integer;
    function InStr(const s:string; const a:array of string):boolean;
    function RemoveCaractere(const aValue:string):string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;


implementation

{$R *.dfm}

procedure TForm1.Button2Click;
begin
  if OpenDialog1.Execute then
  begin
    Edit1.Text := OpenDialog1.FileName;
    Edit1.SetFocus;
    Edit1.SelectAll;
  end;
end;

procedure TForm1.Button1Click;
var  a, b: string; i: integer;
begin
  if (Edit1.Text = '') then
  begin
    showmessage('Informe o caminho do arquivo');
    exit;
  end;
  AssignFile(arq, Edit1.Text);
  Reset(arq);
  while not Eof(arq) do
  begin
    ReadLn(arq, a);
    i := 1;
    while TokenN(a, i) <> '' do
    begin

      b := RemoveCaractere(TokenN(a, i));
      x.Values[b] := IntToStr(ValueOf(x.Values[b]) + 1);
      Inc(i);
    end;
  end;
  showmessage('Adicionado!');
  adc := true;
end;

function TForm1.TokenN;
var  i,m,count:integer;
begin
  Result:='';
  count:=0;
  i:=1;
  while i<=Length(aTokenList) do
  begin
    m:=i;
    while (i<=Length(aTokenList)) and (aTokenList[i]<>aTokenSeparator) do
      Inc(i);
    Inc(count);
    if count=aIndex then
    begin
      Result:=Copy(aTokenList,m,i-m);
      Break;
    end;
    Inc(i);
  end;
end;

function TForm1.ValueOf;
var  i:integer; s:string;
begin
  s:=aValue;
  for i:=Length(s) downto 1 do
    if s[i]=FormatSettings.ThousandSeparator then
      Delete(s,i,1);
  Result:=strtointdef(s,0);
end;

procedure TForm1.Button3Click;
var i: integer;
begin
    if not adc then
      Button1Click(Sender);
    DLMemo1.Clear;
    x.Sort;
    for i := 0 to x.Count - 1 do
    begin
      DLMemo1.Lines.Add(UTF8Decode(x[i]));
    end;
    adc := false;
end;

procedure TForm1.FormCreate;
begin
  x := TStringList.Create;
  adc := false;
end;

procedure TForm1.FormDestroy;
begin
  x.Free;
end;

procedure TForm1.Button4Click;
begin
  x.Clear;
  DLMemo1.Clear;
  adc := false;  
end;

function TForm1.RemoveCaractere;
var a: string; i: integer;
begin
  for i := 1 to length(aValue) do
    if not InStr(aValue[i], ['(', ')', ':', ',', '.', ';', '?', '!', '"', '[', ']', '1', '2']) then
      a := a + LowerCase(aValue[i]);
  result := a;
end;

function TForm1.InStr;
var i:integer;
begin
  Result:=False;
  for i:=low(a) to high(a) do
    if a[i]=s then
    begin
      Result:=True;
      Exit;
    end;
end;

end.
