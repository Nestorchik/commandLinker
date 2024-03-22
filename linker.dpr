program linker;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils, Windows;

var
  str1, str2, commString: String;
  logFilePath, logFileName, logFileExt: string;
  longTimeStamp, hourTimeStamp: string;
  logFile: TextFile;
  batFile: TextFile;
  batFilePath, batFileName, batFileExt: string;
  commandLine: String;
  mklinkPathSlash: String;
  errorExecuting: String;

procedure appendLogFile(LogString: string);
begin
  If NOT DirectoryExists(ExtractFilePath(ParamStr(0)) + logFilePath) then
    try
      CreateDir(ExtractFilePath(ParamStr(0)) + logFilePath)
    finally
    end;

  if FileExists(logFileName) then
  begin
    try
      AssignFile(logFile, logFileName);
      Append(logFile);
      Writeln(logFile, LogString);
      CloseFile(logFile);
    finally
    end;
  end
  else
  begin
    AssignFile(logFile, logFileName);
    Rewrite(logFile);
    Writeln(logFile, LogString);
    CloseFile(logFile);
  end;
end;

procedure saveBatFile(LogString: string);
begin
  If NOT DirectoryExists(ExtractFilePath(ParamStr(0)) + batFilePath) then
    try
      CreateDir(ExtractFilePath(ParamStr(0)) + batFilePath)
    finally
    end;

  begin
    AssignFile(batFile, batFileName);
    Rewrite(batFile);
    Writeln(batFile, LogString);
    CloseFile(batFile);
  end;

  begin
    AssignFile(batFile, 'temp.bat');
    Rewrite(batFile);
    Writeln(batFile, LogString);
    CloseFile(batFile);
    try
      errorExecuting := UIntToStr(WinExec('temp.bat', SW_HIDE));
    finally
    end;
    appendLogFile(longTimeStamp + ': ' + commandLine);
  end;
  sleep(500);
  DeleteFile('temp.bat');
end;

function IfThisDir(path: string): boolean;
var
  srs: TSearchRec;
  filefound: Boolean;
begin
  IfThisDir := False;
  filefound := false;
  if FindFirst(path + '\*.*', faAnyFile, srs) = 0 then
  begin
    While findnext(srs) = 0 do
    begin
      if srs.Name = '..' then filefound := true;
      if (srs.Attr and faDirectory) <> 0 then;
    end;
  end;
  if not filefound then IfThisDir := True;
end;

begin

  if (ParamStr(1) = '') or (ParamStr(2) = '') then
    exit;

  commandLine := '';

  longTimeStamp := FormatDateTime('yyyymmdd-hhnnsszzz', now);
  hourTimeStamp := FormatDateTime('yyyymmdd-hh', now);

  logFilePath := 'logs\';
  logFileName := 'linker';
  logFileExt := '.log';
  logFileName := ExtractFilePath(ParamStr(0)) + logFilePath + logFileName + '-' + hourTimeStamp + logFileExt;

  batFilePath := 'bat\';
  batFileName := 'linker';
  batFileExt := '.bat';
  batFileName := ExtractFilePath(ParamStr(0)) + batFilePath + batFileName + '-' + longTimeStamp + batFileExt;

  str1 := ParamStr(1);
  str2 := ParamStr(2);
  mklinkPathSlash := '';

  if NOT IfThisDir(str2) then mklinkPathSlash := '/D';
  commandLine := 'mklink' + ' ' + mklinkPathSlash + ' ' + str1 + ' ' + str2;

  SaveBatFile(commandLine);
{
  Writeln('str1 ' + str1);
  Writeln('str2 ' + str2);
  Writeln('commString ' + commString);
  Writeln('ExtractFilePath str1 ' + ExtractFilePath(str1));
  Writeln('ExtractFileName str1 ' + Extractfilename(str1));
  Writeln('ExtractFilePath str2 ' + ExtractFilePath(str2));
  Writeln('ExtractFileName str2 ' + Extractfilename(str2));
  Writeln('logFileName ' + logFileName);
  Writeln('hourTimeStamp ' + hourTimeStamp);
  Writeln('longTimeStamp ' + longTimeStamp);
  Writeln('batFileNAme ' + batFileName);
  Writeln('mklinkPathSlash ' + mklinkPathSlash);
  Writeln('commandLine ' + commandLine);
  Writeln(Extractfilename(str1) + '\');
  Writeln(Extractfilename(str2) + '\');
}
end.
