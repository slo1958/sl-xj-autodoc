#tag Class
Protected Class clAutodocSourceGeneric
	#tag Method, Flags = &h0
		Sub BuildSnippets(SnippetFileName as string)
		  
		  self.Snippets = new Dictionary
		  
		  var fld as FolderItem = self.TemplatesFolder.child(SnippetFileName)
		  
		  if not fld.Exists  then return
		  
		  var textStream as TextInputStream = TextInputStream.Open(fld)
		  
		  var lastkey as string
		  
		  while not textStream.EndOfFile
		    var line as string = textStream.ReadLine().trim
		    
		    if line.left(1) = "#" then
		      lastkey = line.mid(2, 999).trim
		      
		    elseif lastkey <> "" then
		      var tmp as string = self.Snippets.Lookup(lastkey, "")
		      tmp = tmp + EndOfLine + line
		      self.Snippets.Value(lastkey) = tmp
		      
		    else
		      
		    end if
		    
		  wend
		  
		  textStream.close
		  
		  for each k as string in self.Snippets.keys
		    System.DebugLog("Code snippet key " + k)
		    
		  next
		  
		  return 
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(templates as FolderItem, projectname as string, Data as clDataTable)
		  self.TemplatesFolder = templates
		  self.MyData = data
		  self.Project = projectname
		  self.Snippets = nil
		  
		  
		End Sub
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

	#tag Method, Flags = &h1
		Protected Function ReplaceSnippets(snippet_tag as string, replacement as Dictionary) As String
		  
		  var work as string 
		  
		  work = self.Snippets.value(snippet_tag)
		  
		  for each k as string in replacement.keys
		    work = work.ReplaceAll(k, replacement.value(k))
		    
		  next
		  
		  return work
		  
		End Function
	#tag EndMethod


	#tag Note, Name = SnippedFileFormat
		
		#name of snippet
		text
		text
		text
		
		Placeholders in code snippets
		
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
		MyData As clDataTable
	#tag EndProperty

	#tag Property, Flags = &h0
		Project As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Snippets As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		TemplatesFolder As FolderItem
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
	#tag EndViewBehavior
End Class
#tag EndClass
