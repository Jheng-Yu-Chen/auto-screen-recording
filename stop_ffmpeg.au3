#include <MsgBoxConstants.au3>
;���o�ثe�ϥΪ̪��a�ؿ�
Local $UserHome = EnvGet("SystemDrive") & EnvGet("HOMEPATH") & "\"
;MsgBox(0, "$UserHome: ", $UserHome)
;ffmpeg.exe��m
Local $FFMPEG = IniRead( $UserHome & "screen_recorder.ini", "General", "program_path", "C:\ffmpeg\bin\")
;MsgBox(0, "$FFMPEG: ", $FFMPEG)


If WinExists($FFMPEG & "ffmpeg.exe") Then
	  $Windowlist=WinList( $FFMPEG & "ffmpeg.exe")
	  For $i = 1 to $Windowlist[0][0]
			  $winhandle=$Windowlist[$i][1]
			  ;msgbox(0,"Window handle for ", $winhandle)
			  ControlSend($winhandle,"","","q")
	  Next


	  WinWaitClose ($FFMPEG & "ffmpeg.exe")
	  sleep(1000)
	  MsgBox(0, "�ୱ���s", "�v���x�s���\!")
Else
	  MsgBox(0, "�ୱ���s", "�Х�����""�ୱ���s.exe""!")
EndIf




;Shutdown(0)
;Run(@ComSpec & " /c " & 'logoff', "", @SW_HIDE)