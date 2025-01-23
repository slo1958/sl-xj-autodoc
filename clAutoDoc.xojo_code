#tag Class
Protected Class clAutoDoc
	#tag Method, Flags = &h0
		Sub Analyze()
		  
		  FindProjectFile
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(fld as FolderItem, configuartion as clAutoDocConfiguration)
		  
		  self.basefolder = fld
		  
		  if configuartion = nil then
		    self.config = new clAutoDocConfiguration
		    
		  else
		    self.config = configuartion
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FindProjectFile()
		  
		  for each fld as FolderItem in self.baseFolder.Children
		    if fld.IsFolder then
		      
		    elseif fld.Name.right( config.ProjectExtension.Length) = config.ProjectExtension then
		      projectFile = fld
		      
		    else
		      
		    end if
		     
		    
		  next
		  
		  if projectFile = nil then
		    System.DebugLog("Cannot find project file")
		    Return
		    
		  else
		    System.DebugLog("Project file is " + projectFile.Name)
		    
		  end if
		  
		  var txtin as TextInputStream = TextInputStream.Open(projectFile)
		  
		  txtin.Encoding = Encodings.UTF8
		  
		  while not txtin.EndOfFile
		    var line as string = txtin.ReadLine
		    self.items.Add(new clAutoDocSourceFile(line, self.baseFolder, config.CodeExtension ))
		    
		  wend
		  
		  txtin.close
		  
		  return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetInfoTable() As clDataTable
		  
		  var t as  clDataTable
		  
		  for each f as clAutoDocSourceFile in self.items
		    var t1 as clDataTable = f.GetInfoTable
		    
		    if t1 <> nil then 
		      
		      if t = nil then
		        t = t1
		      else
		        t.AddTableData(t1, clDataTable.AddRowMode.CreateNewColumn)
		      end if
		       
		    end if
		  next
		  
		  return t
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		baseFolder As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		config As clAutoDocConfiguration
	#tag EndProperty

	#tag Property, Flags = &h0
		items() As clAutoDocSourceFile
	#tag EndProperty

	#tag Property, Flags = &h0
		projectFile As FolderItem
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
			Name="config"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
