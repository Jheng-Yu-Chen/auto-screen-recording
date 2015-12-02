#include <MsgBoxConstants.au3>
#include <DateTimeConstants.au3>
#include <GUIConstantsEx.au3>
#include <Date.au3>





;取得目前使用者的家目錄
Local $UserHome = EnvGet("SystemDrive") & EnvGet("HOMEPATH") & "\"
;MsgBox(0, "$UserHome: ", $UserHome)
;ffmpeg.exe位置
Local $FFMPEG = IniRead( $UserHome & "screen_recorder.ini", "General", "program_path", "C:\ffmpeg\bin\")
;MsgBox(0, "$FFMPEG: ", $FFMPEG)

;影片輸出資料夾
Local $OutputPath = IniRead( $UserHome & "screen_recorder.ini", "General", "output_path", $UserHome & "Videos\")
;MsgBox(0, "$OutputPath: ", $OutputPath)
;-r
Local $FPS = IniRead( $UserHome & "screen_recorder.ini", "Parameters", "fps", "10")
;MsgBox(0, "$FPS: ", $FPS)
;-q
Local $Quality = IniRead( $UserHome & "screen_recorder.ini", "Parameters", "quality", "15")
;MsgBox(0, "$Quality: ", $Quality)
;-rtbufsize
Local $BufferSize = IniRead( $UserHome & "screen_recorder.ini", "Parameters", "buffer_size", "1500M")
;MsgBox(0, "$BufferSize: ", $BufferSize)
;video input device
Local $VideoDevice = IniRead ( $UserHome & "screen_recorder.ini" , "Parameters", "video_device", "screen-capture-recorder")
;MsgBox(0, "$VideoDevice: ", $VideoDevice)

Local $AudioDevice = IniRead ( $UserHome & "screen_recorder.ini" , "Parameters", "audio_device", "Null")
;MsgBox(0, "$AudioDevice: ", $AudioDevice)

Local $VideoFormat = IniRead ( $UserHome & "screen_recorder.ini" , "Parameters", "video_format", "flv")
;MsgBox(0, "$VideoFormat: ", $VideoFormat)

Local $Date = _DateTimeFormat(_NowCalc(), 1) & " " & _NowTime(5)
Local $Filename=_DateFormat($Date, "yyyyMMdd_HH-mm-ss")
;MsgBox(0, "$Filename: ", $Filename)


If WinExists($FFMPEG & "ffmpeg.exe") Then
		 MsgBox($MB_SYSTEMMODAL, "桌面錄製", "桌面錄製已經在背景執行!")
	 Else
		 RunWait(@ComSpec & ' /c start ffmpeg.exe' & " -rtbufsize " & $BufferSize & " -f dshow -i video=""" & $VideoDevice & """ -f dshow -i audio=""" & $AudioDevice & """ -r " & $FPS & " -q " &  $Quality & " " & $OutputPath & $Filename & "." & $VideoFormat , $FFMPEG)
		 ;MsgBox(0, "$Parameters: ", ' /c start ffmpeg.exe' & " -rtbufsize " & $BufferSize & " -f dshow -i video=""" & $VideoDevice & """ -f dshow -i audio=""" & $AudioDevice & """ -r " & $FPS & " -q " &  $Quality & " " & $OutputPath & $Filename & "." & $VideoFormat)

		 WinWaitActive ($FFMPEG & "ffmpeg.exe")
		 WinSetState($FFMPEG & "ffmpeg.exe","",@SW_HIDE)
EndIf






Func _DateFormat($Date, $style)
    Local $hGui = GUICreate("My GUI get date", 200, 200, 800, 200)
    Local $idDate = GUICtrlCreateDate($Date, 10, 10, 185, 20)
    GUICtrlSendMsg($idDate, 0x1032, 0, $style)
    Local $sReturn = GUICtrlRead($idDate)
    GUIDelete($hGui)
    Return $sReturn
 EndFunc


