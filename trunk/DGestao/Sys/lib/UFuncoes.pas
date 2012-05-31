unit UFuncoes;

interface

uses
  Windows, Forms, Messages, SysUtils, Classes, ExtCtrls, ShellApi, Printers,
  Graphics, IniFiles, PSApi, Winsock, WinSvc;

  function GetExeVersion(const FileName : TFileName) : String; overload;
  function GetExeVersion : String; overload;
  function GetVersion : String;

implementation

uses UInfoVersao;

function GetExeVersion(const FileName : TFileName) : String;
type
  PFFI = ^vs_FixedFileInfo;
var
  F: PFFI;
  Handle: Dword;
  Len: Longint;
  Data: Pchar;
  Buffer: Pointer;
  Tamanho: Dword;
  PFileName: Pchar;
begin
   PFileName := StrAlloc(Length(FileName) + 1);
   StrPcopy(PFileName, FileName);
   Len := GetFileVersionInfoSize(PFileName, Handle);
   Result := '';
   if (Len > 0) then
   begin
     Data := StrAlloc(Len + 1);
     if GetFileVersionInfo(PFileName, Handle, Len, Data) then
     begin
       VerQueryValue(Data, '\', Buffer, Tamanho);
       F := PFFI(Buffer);
       Result := Format('%d.%d.%d.%d ', [HiWord(F^.dwFileVersionMs),
                                         LoWord(F^.dwFileVersionMs),
                                         HiWord(F^.dwFileVersionLs),
                                         Loword(F^.dwFileVersionLs)]);
     end;
     StrDispose(Data)
   end;
   StrDispose(PFileName);
end;

Function GetExeVersion : String;
type
   PFFI = ^vs_FixedFileInfo;
var
   F       : PFFI;
   Handle  : Dword;
   Len     : Longint;
   Data    : Pchar;
   Buffer  : Pointer;
   Tamanho : Dword;
   Parquivo: Pchar;
   Arquivo : String;
begin
   Arquivo  := ParamStr(0);
   Parquivo := StrAlloc(Length(Arquivo) + 1);
   StrPcopy(Parquivo, Arquivo);
   Len := GetFileVersionInfoSize(Parquivo, Handle);
   Result := '';
   if Len > 0 then
   begin
      Data:=StrAlloc(Len+1);
      if GetFileVersionInfo(Parquivo,Handle,Len,Data) then
      begin
         VerQueryValue(Data, '',Buffer,Tamanho);
         F := PFFI(Buffer);
         Result := Format('%d.%d.%d.%d',
                          [HiWord(F^.dwFileVersionMs),
                           LoWord(F^.dwFileVersionMs),
                           HiWord(F^.dwFileVersionLs),
                           Loword(F^.dwFileVersionLs)]
                         );
      end;
      StrDispose(Data);
   end;
   StrDispose(Parquivo);
end;

function GetVersion : String;
begin
  Result := TInfoVersao.GetInstance().getPropertyValue(ivFILE_VERSION);
end;

end.
