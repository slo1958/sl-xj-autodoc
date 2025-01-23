#tag Class
Protected Class clMetadata
	#tag Method, Flags = &h0
		Sub AddFormattedMetaData(Entry as string)
		  
		  data_list.Append(Entry)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddMetaData(DataType as string, Message as string)
		  
		  var tmp_str as string = DataType.Trim.ReplaceAll(":","-") +":"+Message.Trim
		  
		  data_list.Append(tmp_str)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AllFormattedData() As string()
		  var ret() as string
		  
		  for each s as string in self.data_list
		    ret.Add(s)
		    
		  next
		  
		  return ret
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private data_list() As string
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
	#tag EndViewBehavior
End Class
#tag EndClass
