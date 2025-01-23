#tag Class
Protected Class clAutoDocSourceFile
	#tag Method, Flags = &h0
		Sub AnalyzeElement(FileExtension as string)
		  
		  if self.FullFilePath = nil then return 
		  
		  if self.FullFilePath.IsFolder then return 
		  
		  if not self.FullFilePath.Exists then return
		  
		  if self.FullFilePath.name.right( FileExtension.Length) <> FileExtension then Return
		  
		  var txtin as TextInputStream = TextInputStream.Open(self.FullFilePath)
		  
		  self.tagstack.RemoveAll
		  
		  var CurrentElement as clAutoDocElement
		  
		  var sourceLine as integer
		  
		  while not txtin.EndOfFile
		    sourceLine = sourceLine + 1
		    var line as string = txtin.ReadLine
		    
		    var lineTrim as string = line.trim
		    
		    if lineTrim.left(5) = "#tag " then
		      var commaIndex as integer = lineTrim.IndexOf(",")
		      var nameindex as integer = lineTrim.IndexOf("Name = ")
		      
		      if commaIndex <= 0 then
		        commaIndex = 999
		      end if
		      
		      var tagitem as string = lineTrim.left(commaIndex).mid(5,999).trim
		      var nameitem as string = ""
		      
		      if nameindex >0 then  nameitem = lineTrim.mid(nameindex, 999).trim
		      
		      System.DebugLog(self.FullFilePath.name + " " + str(sourceLine) + ":" + tagitem+" name:" + nameitem)
		      
		      if tagitem.left(3)="End" then
		        if self.tagstack(tagstack.LastIndex) = tagitem.mid(4,99).trim then
		          call tagstack.Pop()
		          
		        else
		          
		          
		        end if
		        
		      elseif tagitem <> "Instance" then
		        self.tagstack.Add(tagitem)
		        select case tagitem 
		        case "Method"
		          CurrentElement = new clAutoDocMethod(tagitem)
		          
		        case "Note"
		          CurrentElement = new clAutoDocNote(tagitem, nameitem)
		          
		        case else
		          CurrentElement  = nil
		          
		        end select
		        
		        if CurrentElement <> nil then self.Elements.Add(CurrentElement)
		        
		      end if
		      
		    elseif CurrentElement <> nil then
		      CurrentElement.AddSourceLine(Line)
		      
		    end if
		    
		  wend
		  
		  txtin.close
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckFIle(relpath as String)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(DefinitionString as string, projectBaseFolder as FolderItem, FileExtension as string)
		  var tmp0() as string
		  
		  tmp0 = DefinitionString.Split(";")
		  
		  if tmp0.Count < 1 then return
		  
		  var tmp1() as string = tmp0(0).Split("=")
		  
		  select case tmp1.count
		    
		  case 0
		    return
		    
		  case 1
		    self.value = tmp1(0).trim
		    
		  case 2
		    self.category = tmp1(0).trim
		    if tmp0.count = 1 then
		      self.value = tmp1(1).trim
		      
		    else
		      self.name = tmp1(1).trim 
		      
		    end if
		    
		  case else
		    self.Value = tmp0(0)
		    
		  end select
		  
		  if tmp0.count = 1 then return
		  
		  try
		    var flagStartIndex as integer
		    
		    if tmp0(1).trim.left(2)="&h" then
		      flagStartIndex = 1
		      
		    else
		      self.filepath = tmp0(1).trim
		      
		    end if
		    
		    for i as integer = flagStartIndex to tmp0.LastIndex
		      self.flags.add(tmp0(i).trim)
		      
		    next
		    
		    
		  Catch
		    
		  end try
		  
		  if self.filepath.Length > 0 then
		    var fld as FolderItem = projectBaseFolder
		    var steps() as string = self.filepath.split("/")
		    
		    for each stp as string in steps
		      fld = fld.Child(stp)
		      
		    next
		    
		    self.FullFilePath = fld
		    
		  end if
		  
		  if self.FullFilePath = nil then return
		  if self.FullFilePath.Exists then 
		    AnalyzeElement(FileExtension)
		    
		  end if
		  
		  
		  return
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetInfoTable() As clDataTable
		  
		  // to move somewhere else
		  
		  var t as new clDataTable("Info")
		  
		  for each element as clAutoDocElement in self.Elements
		    if element isa clAutoDocMethod then
		      clAutoDocMethod(element).ParseSourceCode
		      
		      var t1 as clDataTable = clAutoDocMethod(element).GetInfoTable
		      
		      if t1 <> nil then 
		        t1.Column("Source") = self.Name
		        
		        t.AddTableData(t1, clDataTable.AddRowMode.CreateNewColumn)
		        
		      end if
		      
		    end if
		    
		    
		  next
		  
		  return t
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Category As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Components As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Elements() As clAutoDocElement
	#tag EndProperty

	#tag Property, Flags = &h0
		filepath As string
	#tag EndProperty

	#tag Property, Flags = &h0
		flags() As string
	#tag EndProperty

	#tag Property, Flags = &h0
		FullFilePath As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		IsParameter As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Name As String
	#tag EndProperty

	#tag Property, Flags = &h0
		tagstack() As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Value As String
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
			Name="Category"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Value"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsParameter"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="filepath"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Components"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
