#tag Class
Protected Class clAutoDocElement
	#tag Method, Flags = &h0
		Sub AddSourceLine(sourceLine as string)
		  
		  if self.SourceLines.Count = 0 and sourceLine.Length = 0 then return
		  
		  self.sourcelines.add(sourceLine.ReplaceAll(chr(9), "  "))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(tag as string)
		  self.MainTag = tag
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetInfoTable() As clDataTable
		  return nil
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		MainTag As String
	#tag EndProperty

	#tag Property, Flags = &h0
		SourceLines() As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MainTag"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
