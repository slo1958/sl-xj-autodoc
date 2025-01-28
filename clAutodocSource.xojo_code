#tag Class
Protected Class clAutodocSource
	#tag Method, Flags = &h0
		Sub Constructor(BasePageName as string, Data as clDataTable)
		  self.PageNamePrefix = BasePageName
		  self.MyData = data
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getChildren(path as string) As string()
		  
		   System.DebugLog(CurrentMethodName + ": " + path)
		  
		  if path = "page" then
		    return array("clDataSerie","clDataTable")
		    
		  end if
		  
		  
		  if  path =  "page.template..page_body..top_menu..top_menu_element"  _
		    or path = "page.clDataTable.template..page_body..top_menu..top_menu_element" _
		    or path = "page.clDataSerie.template..page_body..top_menu..top_menu_element"  then 
		    
		    return array("clDataSerie","clDataTable")
		    
		  end if
		  
		  if path = "page.template.clDataSerie.page_header" then
		    return array("alpha1","alpha2")
		    
		  end if
		  
		  if path = "page.template.clDataTable.page_header" then
		    return array("alpha1","alpha2")
		    
		  end if
		  
		  return array("")
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getReplacements(path as string) As Dictionary
		  
		  // System.DebugLog(CurrentMethodName + ": " + path)
		   
		  var d as new Dictionary
		  
		  // add commons
		  d.value("$$authors$$") = "AutoDoc"
		  d.value("$$copyright_owner$$") = "sl"
		  d.value("$$copyright_href$$") = "./"
		   
		  d.value("$$top_left_href$$") = "./mypage_.html"
		  d.value("$$top_left_title$$") = "lib-data" 
		  
		  d.value("$$second_left_href$$") = "./"
		  d.value("$$second_left_title$$") = "Documentation" 
		  
		  d.value("$$drop_menu_title$$") = "Classes"
		  d.value("$$page_action_message$$") = "Documentation"
		  
		  select case path
		    
		  case "page.template..page_body..main."
		    d.value("$$page_main_title$$") = "About lib-data"
		    
		  case "page.clDataTable.template..page_body..main"
		    d.value("$$page_maint_title$$") = "About clDataTable"
		    
		  case "page.clDataSerie.template..page_body..main"
		    d.value("$$page_maint_title$$") = "About clDataSerie"
		    
		  case "page.template..page_body..top_menu..top_menu_element.clDataSerie"
		    
		    d.value("$$drop_item_label$$") = "clDataSerie"
		     d.value("$$drop_item_href$$") = "./mypage_clDataSerie.html"
		    
		    
		  case "page.template..page_body..top_menu..top_menu_element.clDataTable"
		    
		    d.value("$$drop_item_label$$") = "clDataTable"
		    d.value("$$drop_item_href$$") = "./mypage_clDataTable.html"
		    
		    
		  case else
		    
		    
		  end Select
		  
		  return  d
		  
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
