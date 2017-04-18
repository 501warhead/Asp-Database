' Sean Kelly
Partial Class Authors
    Inherits System.Web.UI.Page


    Protected Sub fvGridAuthorSelect_ItemDeleting1(sender As Object, e As FormViewDeleteEventArgs) Handles fvGridAuthorSelect.ItemDeleting
        Dim lname As String
        Dim fname As String
        Dim ans As MsgBoxResult

        lname = CStr(e.Values("Lname"))
        fname = CStr(e.Values("Fname"))
        ans = MsgBox("Are you sure you wish to delete the author: " & vbNewLine & fname & " " & lname & "?", MsgBoxStyle.YesNo, "Confirm Deletion")
        If ans = MsgBoxResult.No Then
            e.Cancel = True
        Else
            e.Cancel = False
        End If
    End Sub
End Class
