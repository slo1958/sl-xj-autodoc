#tag Class
Protected Class clAutoDocNote
Inherits clAutoDocElement
	#tag Method, Flags = &h0
		Sub Constructor(tag as string, name as string)
		  super.Constructor(tag)
		  
		  if name.IndexOf("=") > 0 then
		    self.NoteName = name.mid(name.IndexOf("=")+2, 999).trim
		    
		  else
		    self.NoteName = name
		    
		  end if
		  
		  Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetInfoTable() As clDataTable
		  //
		  // Create output table with information about the method
		  //
		  // Paramters:
		  // (none)
		  // 
		  // Returns:
		  // populated datatable
		  //
		  
		  var c1 as new clStringDataSerie(kSource)
		  var c2 as new clStringDataSerie(kType)
		  var c3 as new clStringDataSerie(kRowType)
		  var c6 as new clStringDataSerie(kParentName)
		  var c4 as new clStringDataSerie(kName)
		  var c5 as new clStringDataSerie(kDescription)
		  
		  var t as new clDataTable("Doc", array(c1, c2, c3, c6, c4, c5))
		  
		  var r as clDataRow
		  
		  r = new clDataRow()
		  r.Cell(kType) = kTypeNote
		  r.Cell(kRowType) = "N" 
		  r.Cell(kName) = self.NoteName
		  
		  t.AddRow(r)
		  
		  return t
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		NoteName As string
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
		#tag ViewProperty
			Name="NoteName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
