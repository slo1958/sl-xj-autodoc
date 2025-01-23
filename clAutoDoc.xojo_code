#tag Class
Protected Class clAutoDoc
	#tag Method, Flags = &h0
		Sub Analyze(ExclusionList() as string)
		  //
		  // Collect the list of project files
		  //
		  // Parameters:
		  // - list of subfolder to exclude
		  //
		  // Returns:
		  // (nothing)
		  //
		  
		  FindProjectFile(ExclusionList)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(fld as FolderItem, configuartion as clAutoDocConfiguration)
		  //
		  // 
		  // Parameters:
		  // - fld : folderitem pointing to the project folder
		  // - confuguration: config parameters
		  //
		  self.basefolder = fld
		  
		  if configuartion = nil then
		    self.config = new clAutoDocConfiguration
		    
		  else
		    self.config = configuartion
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FindProjectFile(ExclusionList() as string)
		  //
		  // Locate the project file in the selected project folder
		  //
		  // Parameters:
		  // - list of subfolder to exclude
		  //
		  // Returns:
		  // (nothing)
		  //
		  
		  
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
		    var toExclude as boolean = false
		    for each s as string in ExclusionList
		      if line.IndexOf(s+"/") >0 then toExclude = True
		      
		    next
		    if not toExclude then self.items.Add(new clAutoDocSourceFile(line, self.baseFolder, config.CodeExtension ))
		    
		  wend
		  
		  txtin.close
		  
		  return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetInfoTable() As clDataTable
		  //
		  // Generate the output table by consolidating info taken from each souce file
		  //
		  // Parameters:
		  // -
		  //
		  // Returns:
		  //  consolidated datable
		  //
		  var output_table as  clDataTable
		  
		  for each f as clAutoDocSourceFile in self.items
		    
		    var t as clDataTable = f.GetInfoTable
		    
		    if t <> nil then 
		      
		      if output_table = nil then
		        output_table = t
		        
		      else
		        output_table.AddTableData(t, clDataTable.AddRowMode.CreateNewColumn)
		        
		      end if
		      
		    end if
		  next
		  
		  return output_table
		  
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
	#tag EndViewBehavior
End Class
#tag EndClass
