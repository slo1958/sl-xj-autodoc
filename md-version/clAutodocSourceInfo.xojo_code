#tag Class
Protected Class clAutodocSourceInfo
	#tag Method, Flags = &h0
		Sub Constructor(projectname as string, Data as clDataTable)
		  
		  self.MyData = data
		  self.Author = "sl"
		  
		  self.Project = projectname
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getMethodInfo(sourcefile as string, methodName as string) As clAutoDocMethodInfo
		  
		  var ret as new clAutoDocMethodInfo(sourcefile, methodName)
		  
		  
		  var LastType as string ="Method"
		  var LastSource as String = sourcefile
		  var RType as string = "M"
		  var entry as string = methodName
		  
		  var selectedrows() as integer 
		  var d as clDataTable 
		  
		  
		  selectedrows  = self.MyData.FindAllMatchingRowIndexes( _
		  array(clAutoDocElement.kType, clAutoDocElement.kSource, clAutoDocElement.kParentName) _
		  , array(LastType, LastSource,  entry ) _
		  )
		  
		  d = self.MyData.getSelectedRowsAsTable(selectedrows).SelectColumns(_
		  clAutoDocElement.kParentName _
		  , clAutoDocElement.kRowType _
		  , clAutoDocElement.kName _
		  ,clAutoDocElement.kDescription _
		  )
		  
		  
		  for each row as clDataRow in d
		    var rowtype as string = row.GetCell(clAutoDocElement.kRowType)
		    if  rowtype = "MP" then
		      ret.prototype = row.GetCell(clAutoDocElement.kDescription)
		      
		    elseif rowtype.left(1) = "D" then
		      ret.description.add(row.GetCell(clAutoDocElement.kDescription))
		      
		    elseif rowtype = "R" then
		      ret.returnType = row.GetCell(clAutoDocElement.kDescription)
		      
		    elseif rowtype.left(1) = "P" then
		      ret.parameterNames.Add(row.GetCell(clAutoDocElement.kName))
		      ret.parameterTypes.Addrow(row.GetCell(clAutoDocElement.kDescription))
		      
		    elseif rowtype = "M" then
		      ret.methodType = row.GetCell(clAutoDocElement.kDescription)
		      
		    else
		      
		    end if
		    
		  next
		  
		  
		  return ret
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ListMethodInSource(sourcefile as string) As string()
		  
		  var LastType as string ="Method"
		  var LastSource as String = sourcefile
		  var RType as string = "M"
		  
		  
		  var selectedrows() as integer = self.MyData.FindAllMatchingRowIndexes( _
		  array(clAutoDocElement.kType, clAutoDocElement.kSource, clAutoDocElement.kRowType) _
		  , array(LastType, LastSource, RType) _
		  )
		  
		  var d as clDataTable = self.MyData.getSelectedRowsAsTable(selectedrows).SelectColumns(clAutoDocElement.kSource, clAutoDocElement.kName)
		  
		  var res() as string
		  
		  for each row as clDataRow in d
		    res.add(row.GetCell(clAutoDocElement.kName))
		    
		  next
		  
		  res.sort
		  
		  return res
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ListSourceFiles() As string()
		  
		  var tsummary as clDataTable = self.MyData.GroupBy(array(clAutoDocElement.kType, clAutoDocElement.kSource))
		  var ret() as string
		  
		  for each row as clDataRow in tsummary
		    
		    if row.Cell(clAutoDocElement.kType)= "Method" then
		      ret.Add(row.Cell(clAutoDocElement.kSource))
		      
		    end if
		    
		  next
		  
		  ret.sort
		  
		  return ret
		End Function
	#tag EndMethod


	#tag Note, Name = Untitled
		$$authors$$
		$$copyright_owner$$
		$$copyright_href$$
		
		$$page_main_title$$
		$$page_action_message$$
		
		$$topleft_href$$
		$$topleft_title$$
		
		$$second_left_href$$
		$$second_left_title$$
		
		$$drop_item_href$$
		$$drop_item_label$$
		
		$$left_menu_top_href$$
		$$left_menu_top_label$$
		
		$$left_menu_href$$
		$$left_menu_label$$
	#tag EndNote


	#tag Property, Flags = &h0
		Author As string
	#tag EndProperty

	#tag Property, Flags = &h0
		MyData As clDataTable
	#tag EndProperty

	#tag Property, Flags = &h0
		Project As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Snippets As Dictionary
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
			Name="Project"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Author"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
