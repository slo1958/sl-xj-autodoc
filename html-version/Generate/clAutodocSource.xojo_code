#tag Class
Protected Class clAutodocSource
	#tag Method, Flags = &h0
		Sub BuildSnippets()
		  
		  self.Snippets = new Dictionary
		  
		  var fld as FolderItem = self.TemplatesFolder.child("snippets.txt")
		  
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
		Sub Constructor(templates as folderitem, projectname as string, BasePageName as string, Data as clDataTable)
		  self.PageNamePrefix = BasePageName
		  self.MyData = data
		  self.TemplatesFolder = templates
		  
		  self.Project = projectname
		  
		  self.BuildSnippets()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getChildren(path as string) As string()
		  
		  System.DebugLog(CurrentMethodName + ": " + path)
		  
		  var splitpath() as string = path.Split(".")
		  
		  if path = "page" then
		    return self.ListSourceFiles
		    
		  end if
		  
		  var tag as string
		  
		  
		  tag = "template..page_body..top_menu."
		  
		  if splitpath.IndexOf("top_menu_element")>0  then
		    //if path.left(5) = "page." and path.right(tag.Length) = tag then
		    return self.ListSourceFiles
		    
		  end if
		  
		  tag = ""
		  
		  if splitpath.get(7) = "left_menu_item" then
		    return self.ListSourceFiles
		    
		  end if
		  
		  
		  if splitpath.get(8) = "left_menu_item" then
		    return self.ListMethodInSource(splitpath(1))
		    
		  end if
		  
		  
		  return array("")
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getReplacements(path as string) As Dictionary
		  
		  // System.DebugLog(CurrentMethodName + ": " + path)
		  
		  var d as new Dictionary
		  
		  var splitpath() as string = path.Split(".")
		  
		  // add commons
		  d.value("$$authors$$") = self.Project
		  d.value("$$copyright_owner$$") = "sl"
		  d.value("$$copyright_href$$") = "./"
		  
		  d.value("$$top_left_href$$") = "./mypage_.html"
		  d.value("$$top_left_title$$") = self.Project
		  d.value("$$page_title$$") = self.project
		  
		  d.value("$$second_left_href$$") = "./"
		  d.value("$$second_left_title$$") = "Documentation" 
		  
		  d.value("$$drop_menu_title$$") = "Classes"
		  d.value("$$page_action_message$$") = "Documentation"
		  d.value("$$date_generated$$") = DateTime.Now.SQLDate
		  d.value("$$datetime_generated$$") = DateTime.Now.SQLDateTime
		  
		  
		  if path = "master_link" then
		    d.value("$$start_link_label$$") = self.project
		    d.value("$$start_link_href$$") = "./pages/mypage_.html"
		    return  d
		    
		  end if
		  
		  var tag as string
		  
		  // page.clAutoDoc.template..page_body..top_menu..top_menu_element.clAutoDocMethod
		  
		  tag = ".template..page_body..top_menu..top_menu_element."
		  
		  if splitpath.IndexOf("top_menu_element") > 0 then
		    var idx as integer = splitpath.IndexOf("top_menu_element") 
		    var vv as string = splitpath(idx+1).trim
		    d.Value("$$drop_item_label$$") = vv
		    d.Value("$$drop_item_href$$") = "./mypage_" + vv +".html"
		    
		    return d
		    
		  end if
		  
		  if splitpath.IndexOf("left_menu_item") > 0 then
		    var idx as integer = splitpath.IndexOf("left_menu_item") 
		    var vv as string = splitpath(idx+1).trim
		    
		    d.Value("$$left_menu_label$$") = vv
		    
		    if idx = 7 then 
		      // link to external page
		      d.Value("$$left_menu_href$$") = "./mypage_" + vv +".html"
		      
		    elseif idx = 8 then
		      //. link to anchor
		      d.Value("$$left_menu_href$$") = "#" + vv
		      
		    else
		      
		    end if
		    
		    return d
		    
		  end if
		  
		  if splitpath.IndexOf("main") > 0 then
		    if splitpath.IndexOf("main") = 5 then
		      d.Value("$$page_main_title$$") = "Main page"
		      d.value("$$body$$") = ""
		      
		    else
		      d.Value("$$page_main_title$$") =splitpath(1)
		      d.Value("$$body$$") = pagebody(splitpath(1))
		      
		    end if
		    
		  end if
		  
		  if splitpath.IndexOf("left_menu") > 0 then
		    if splitpath.IndexOf("left_menu") = 5 then
		      d.value("$$left_menu_top_label$$") = "Classes"
		      d.value("$$left_menu_top_href$$")= "./"
		    else
		      d.value("$$left_menu_top_label$$") = "Methods in " + splitpath(1)
		      d.value("$$left_menu_top_href$$")= "./"
		      
		    end if
		    
		    
		    
		  end if
		  
		  tag=".template..page_body..main"
		  if path.IndexOf(tag) > 0 then
		    
		  end if
		  
		  tag = "page..template..page_body..left_menu"
		  if path.indexof(tag) > 0  then
		    d.value("$$left_menu_top_href$$") = "./"
		    d.value("$$left_menu_top_label$$") = "Classes"
		    
		  end if
		  
		  //page.clDataTable.template..page_body..main
		  if path.left(4) = "page"  then // and path.right()   = "page.clDataTable.template..page_body..main" then
		    
		  end if
		  
		  return  d
		  
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

	#tag Method, Flags = &h0
		Function PageBody(sourcefile as string) As string
		  var retStr as string
		  
		  var LastType as string ="Method"
		  var LastSource as String = sourcefile
		  var RType as string = "M"
		  
		  var selectedrows() as integer 
		  var d as clDataTable 
		  
		  selectedrows = self.MyData.FindAllMatchingRowIndexes( _
		  array(clAutoDocElement.kType, clAutoDocElement.kSource, clAutoDocElement.kRowType) _
		  , array(LastType, LastSource, RType) _
		  )
		  
		  d = self.MyData.getSelectedRowsAsTable(selectedrows).SelectColumns(clAutoDocElement.kSource, clAutoDocElement.kName)
		  
		  var res_method() as string
		  
		  for each row as clDataRow in d
		    res_method.add(row.GetCell(clAutoDocElement.kName))
		    
		  next
		  
		  res_method.Sort
		  
		  
		  for each entry as string in res_method
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
		    
		    
		    var method_type as string
		    var prototype as string
		    var description as string
		    var parameter_names() as string
		    var parameter_types() as string
		    var returntype as string
		    
		    
		    for each row as clDataRow in d
		      var rowtype as string = row.GetCell(clAutoDocElement.kRowType)
		      if  rowtype = "MP" then
		        prototype = row.GetCell(clAutoDocElement.kDescription)
		        
		      elseif rowtype.left(1) = "D" then
		        description = description + EndOfLine + row.GetCell(clAutoDocElement.kDescription)
		        
		      elseif rowtype = "R" then
		        returntype = row.GetCell(clAutoDocElement.kDescription)
		        
		      elseif rowtype.left(1) = "P" then
		        parameter_names.Add(row.GetCell(clAutoDocElement.kName))
		        parameter_types.Addrow(row.GetCell(clAutoDocElement.kDescription))
		        
		      elseif rowtype = "M" then
		        method_type = row.GetCell(clAutoDocElement.kDescription)
		        
		      else
		        
		      end if
		      
		    next
		    
		    retStr = retStr + EndOfLine + ReplaceSnippets("Title2_with_Anchor", new Dictionary("$$title_href$$":entry, "$$title_text$$":entry, "$$id$$":entry))
		    
		    if method_type = "Private Function" or method_type = "Private Sub" then
		      retStr = retStr + EndOfLine + ReplaceSnippets("prototype_private_code", new Dictionary("$$prototype_code$$":prototype, "$$title$$":method_type))
		      
		    elseif method_type = "Protected Function" or method_type = "Protected Sub" then
		      retStr = retStr + EndOfLine + ReplaceSnippets("prototype_protected_code", new Dictionary("$$prototype_code$$":prototype, "$$title$$":method_type))
		      
		    else
		      retStr = retStr + EndOfLine + ReplaceSnippets("prototype_code", new Dictionary("$$prototype_code$$":prototype, "$$title$$":method_type))
		      
		    end if
		    
		    //retStr = retStr + EndOfLine + ReplaceSnippets("method_type", new Dictionary("$$method_type$$":method_type))
		    
		    retStr = retStr + EndOfLine + ReplaceSnippets("method_return", new Dictionary("$$return_type$$":returntype))
		    
		    if parameter_names.count > 0 then
		      retStr = retStr + EndOfLine + ReplaceSnippets("parameter_start", new Dictionary("$$text$$":""))
		      
		      for i as integer = 0 to parameter_names.LastIndex
		        
		        retStr = retStr + EndOfLine + ReplaceSnippets("method_parameter",  new Dictionary("$$param_name$$" : parameter_names(i) ,"$$param_description$$":parameter_types(i)))
		        
		      next
		      
		      retStr = retStr + EndOfLine + ReplaceSnippets("parameter_end", new Dictionary("$$text$$":""))
		      
		    end if
		    
		    
		    retStr = retStr + EndOfLine + ReplaceSnippets("description_body", new Dictionary("$$description_body$$":description))
		    
		    
		  next 
		  
		  
		  return retStr
		  
		  
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
		MyData As clDataTable
	#tag EndProperty

	#tag Property, Flags = &h0
		PageNamePrefix As string
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
			Name="PageNamePrefix"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
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
