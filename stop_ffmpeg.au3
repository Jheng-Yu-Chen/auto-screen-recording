#include <MsgBoxConstants.au3>
;取得目前使用者的家目錄
Local $UserHome = EnvGet("SystemDrive") & EnvGet("HOMEPATH") & "\"
;MsgBox(0, "$UserHome: ", $UserHome)
;ffmpeg.exe位置
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
	  MsgBox(0, "桌面錄製", "影片儲存成功!")
Else
	  MsgBox(0, "桌面錄製", "請先執行""桌面錄製.exe""!")
EndIf




;Shutdown(0)
;Run(@ComSpec & " /c " & 'logoff', "", @SW_HIDE)