#tag Class
Protected Class clAutoDocGenHTML
	#tag Method, Flags = &h0
		Sub Constructor(templates as FolderItem, destination as FolderItem, ReplacementSource as clAutodocSource)
		  
		  make_page(templates, destination,"template" , "page", ReplacementSource)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function internal_replace(source as string, replacement as Dictionary) As string
		  
		  
		  var temp as string = source
		  
		  for each k as string in replacement.keys
		    
		    temp = temp.ReplaceAll(k, replacement.value(k))
		    
		  next
		  
		  return temp
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub make_page(templates as FolderItem, destination as FolderItem, BaseTemplate as string, path as string, ReplacementSource as clAutodocSource)
		  
		  var PageName as string = ReplacementSource.PageNamePrefix
		  
		  var template_replacement() as string = ReplacementSource.getChildren(path)
		  
		  if template_replacement.Count = 0 then template_replacement.add("")
		  
		  var results as string = merge(templates, BaseTemplate, path , ReplacementSource)
		  
		  var tout as TextOutputStream = TextOutputStream.Create(destination.child(pagename + ".html"))
		  
		  tout.Write(results)
		  tout.Close
		  
		  
		  for each repl as string in template_replacement
		    var page_results as string = merge(templates, BaseTemplate, path + "." + repl , ReplacementSource)
		    
		    var page_tout as TextOutputStream = TextOutputStream.Create(destination.child(pagename + repl + ".html"))
		    
		    page_tout.Write(page_results)
		    page_tout.Close
		    
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function merge(templates as FolderItem, BaseTemplate as string, path as string, ReplacementSource as clAutodocSource) As String
		  
		  System.DebugLog(CurrentMethodName + ":" + BaseTemplate)
		  
		  // load template
		  
		  var filename as string = BaseTemplate + ".txt"
		  
		  var tin as TextInputStream = TextInputStream.Open(templates.Child(filename))
		  
		  var source as string =  tin.ReadAll
		  
		  tin.Close
		  
		  var template_replacement() as string = ReplacementSource.getChildren(path+"."+basetemplate)
		  
		  if template_replacement.Count = 0 then template_replacement.add("")
		  
		  
		  
		  var transformed as string = ""
		  
		  
		  for each repl as string in template_replacement
		    var starttag as integer 
		    var endtag as integer
		    var tag as string
		    var tagcount as integer
		    var source_copy as string = source
		    
		    var internal_replacements as Dictionary = ReplacementSource.getReplacements(path+"."+basetemplate+"."+repl)
		    
		    source_copy = internal_replace(source_copy, internal_replacements)
		    
		    if source_copy.IndexOf("$$") > 0 then
		      System.DebugLog(CurrentMethodName+": tag not processed " + source_copy.Middle(source_copy.IndexOf("$$"), 20) + " / using: " + path+"."+basetemplate+"."+repl)
		      
		    end if
		    
		    starttag= source_copy.IndexOf("##")
		    
		    while starttag >= 0  and tagcount < 100
		      endtag = source_copy.IndexOf(starttag +2, "##")
		      
		      tag = source_copy.Middle(starttag+2, endtag - starttag-2) 
		      System.DebugLog("found " + tag)
		      
		      var replaced as string = merge(templates, tag, path+"."+basetemplate+"."+repl, ReplacementSource)
		      
		      
		      if starttag > 0 then
		        source_copy = left(source_copy, starttag)  + replaced + source_copy.Middle(endtag+2, 99999)
		        
		      else
		        source_copy =  replaced + source_copy.Middle(endtag+2, 99999)
		        
		      end if
		      
		      starttag= source_copy.IndexOf("##")
		      tagcount = tagcount + 1
		    wend
		    
		    transformed = transformed + EndOfLine + source_copy
		    
		  next
		  
		  Return transformed
		  
		  
		  
		End Function
	#tag EndMethod


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
