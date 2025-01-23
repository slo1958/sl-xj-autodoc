#tag Class
Protected Class clAutoDocElement
	#tag Method, Flags = &h0
		Sub AddSourceLine(sourceLine as string)
		  //
		  // Add the source line for later processing by the parser
		  //
		  // Parameters:
		  // - Sourceline to be added
		  //
		  
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
		  // 
		  // Return the information table
		  // Implemented in type specific subclasses
		  //
		  // Parameters:
		  // (nothing)
		  //
		  // Returns:
		  // Generated data table
		  //
		  
		  
		  return nil
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ParseSourceCode()
		  //
		  // Parse the collected source line. Implemented in type specific subclasses
		  //
		  // Parameters:
		  // (nothing)
		  //
		  // Returns:
		  // (nohting)
		  //
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		MainTag As String
	#tag EndProperty

	#tag Property, Flags = &h0
		SourceLines() As String
	#tag EndProperty


	#tag Constant, Name = kDescription, Type = String, Dynamic = False, Default = \"\"Description\"", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kName, Type = String, Dynamic = False, Default = \"Name", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kParentName, Type = String, Dynamic = False, Default = \"ParentName", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kRowType, Type = String, Dynamic = False, Default = \"RowType", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSource, Type = String, Dynamic = False, Default = \"Source", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kType, Type = String, Dynamic = False, Default = \"Type", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTypeMethod, Type = String, Dynamic = False, Default = \"Method", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTypeNote, Type = String, Dynamic = False, Default = \"Note", Scope = Public
	#tag EndConstant


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
