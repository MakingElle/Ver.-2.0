_Title "Elle - Ver. 2.0"
Dim Shared AI_Name As String
Dim Shared Version As String

AI_Name = UCase$("Elle")
Version = "2.0"

Type QA
    Question As String
    Answer As String
End Type

ReDim QAs(-1) As QA

'Set Up
Randomize Timer


'  READ IN THE DATABASE
Open "Elle.edb" For Input As #1
Do Until EOF(1)

    ReDim _Preserve QAs(UBound(QAs) + 1) As QA

    Line Input #1, QAs(UBound(QAs)).Question
    QAs(UBound(QAs)).Question = UCase$(QAs(UBound(QAs)).Question)

    Line Input #1, QAs(UBound(QAs)).Answer
    QAs(UBound(QAs)).Answer = UCase$(QAs(UBound(QAs)).Answer)

Loop
Close #1


Screen 0
Width 80
Color 15

View Print 3 To 24


'Intro
Color 15
Locate 5, 15: Print "=================================================="
Locate 6, 15: Print "                  _______________               "
Locate 7, 15: Print "   .-.           |[]            |           .-."
Locate 8, 15: Print " __| |__         |  __________  |         __| |__"
Locate 9, 15: Print "[__   __]        |  |  Elle  |  |        [__   __]"
Locate 10, 15: Print "   | |           |  |  V.2.0 |  |           | |"
Locate 11, 15: Print "   | |           |  |________|  |           | |"
Locate 12, 15: Print "   | |           |   ________   |           | |"
Locate 13, 15: Print "   '-'           |   [ [ ]  ]   |           '-'"
Locate 14, 15: Print "                 \___[_[_]__]___|"
Locate 16, 15: Print "==================================================";

WaitForKey
Cls

'Main Interacting
Color 15
Print
Print " [ Introduction To The Use Of Elle - "
Print
Print " [ Welcome to my program called Elle. What is Elle? Elle is the middleman of  ]"
Print " [ sorts to speak with God. A computer program of my own design to which one  ]"
Print " [ can have a conversation with God. One can talk about whatever they wish and]"
Print " [ explore the bible including prayers from centuries ago.                    ]"
Print " [                                                                            ]"
Print " [ Press any key to go on...                                                  ]"

WaitForKey
Cls

Print "]  Hello, you can call me Elle."
Print
Do

    Input "> USER: ", you$
    you$ = MessageCleanCaps$(you$)


    For Index = 0 To UBound(QAs) - 1
        If you$ = QAs(Index).Question Then Exit For
    Next


    Select Case QAs(Index).Answer

        Case "EXITING"

            GoTo EndProgram

        Case "TIME"

            Print "]  "; AI_Name; ": The time is "; Time$; "."

        Case "DATE"

            Print "]  "; AI_Name; ": Today's date is "; Date$; "."

        Case Else

            If Index < UBound(QAs) Then
                Print "]  "; AI_Name; ": "; QAs(Index).Answer
            Else
                Print "]  "; AI_Name; ": Sorry, I don't understand you."
            End If

    End Select

Loop


'Exiting Program...
EndProgram:
Print "]  "; AI_Name; ": It was nice talking to you. Have a great day and we'll see each other soon."
Print
Print
Print

WaitForKey
System




Sub WaitForKey ()
    Do: Loop Until InKey$ = ""
    Do: Loop Until InKey$ <> ""
End Sub



Function MessageCleanCaps$ (Message As String)

    Dim CurrentPosition As Long

    OriginalMessage$ = Message

    Message = LTrim$(RTrim$(Message))

    CurrentPosition = 1

    For i = 1 To Len(Message)

        Char$ = UCase$(Mid$(Message, i, 1))

        Select Case Char$

            Case Chr$(65) TO Chr$(90)

                Mid$(Message, CurrentPosition, 1) = Char$
                CurrentPosition = CurrentPosition + 1

            Case Chr$(32)

                If Mid$(Message, CurrentPosition - 1, 1) <> Chr$(32) Then
                    Mid$(Message, CurrentPosition, 1) = Char$
                    CurrentPosition = CurrentPosition + 1
                End If

        End Select

    Next

    CurrentPosition = CurrentPosition - 1

    If CurrentPosition > Len(Message) Then CurrentPosition = Len(Message)

    MessageCleanCaps$ = LTrim$(RTrim$(Left$(Message, CurrentPosition)))

End Function


