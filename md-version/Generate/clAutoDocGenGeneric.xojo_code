#tag Class
Protected Class clAutoDocGenGeneric
	#tag Method, Flags = &h0
		Sub addDocumentDirectoryFooter(ReplacementSource as clAutodocSourceInfo)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addDocumentDirectoryHeader(ReplacementSource as clAutodocSourceInfo)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addDocumentFileDirectoryEntry(ReplacementSource as clAutodocSourceInfo, filename as string, filecount as integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addDocumentFooter(ReplacementSource as clAutodocSourceInfo)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addDocumentHeader(ReplacementSource as clAutodocSourceInfo)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addFileFooter(ReplacementSource as clAutodocSourceInfo, filename as string, filecount as integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addFileHeader(ReplacementSource as clAutodocSourceInfo, filename as string, filecount as integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addFileMethodDetails(ReplacementSource as clAutodocSourceInfo, filename as string, methodname as string, filecount as integer, methodcount as integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addFileMethodDirectoryEntry(ReplacementSource as clAutodocSourceInfo, filename as string, methodname as string, filecount as integer, methodcount as integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addFileSepartor(ReplacementSource as clAutodocSourceInfo, previousFilename as string, nextFilename as string, filecount as integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addMethodDirectoryFooter(ReplacementSource as clAutodocSourceInfo, filename as string, filecount as integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addMethodDirectoryHeader(ReplacementSource as clAutodocSourceInfo, filename as string, filecount as integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addMethodSeparator(ReplacementSource as clAutodocSourceInfo, Filename as string, previousMethodname as string, nextMethodname as string, filecount as integer, methodcount as integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(sourceTemplates as FolderItem, outputDestination as FolderItem, ReplacementSource as clAutodocSourceInfo = nil)
		  self.templates = sourceTemplates
		  
		  self.destination = outputDestination
		  
		  if ReplacementSource = nil then 
		    
		  else
		    ProcessSourceFiles(ReplacementSource)
		    
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub generationEpilogue(ReplacementSource as clAutodocSourceInfo)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub generationPrologue(templates as FolderItem, ReplacementSource as clAutodocSourceInfo)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub processSourceFiles(ReplacementSource as clAutodocSourceInfo)
		  
		  
		  var filecount as integer
		  var methodcount as integer
		  
		  generationPrologue(templates, ReplacementSource)
		  
		  addDocumentHeader(ReplacementSource)
		  
		  addDocumentDirectoryHeader(ReplacementSource)
		  
		  filecount = 0
		  for each s as string in ReplacementSource.ListSourceFiles
		    filecount = filecount + 1
		    addDocumentFileDirectoryEntry(ReplacementSource, s, filecount)
		    
		  next
		  
		  AddDocumentDirectoryFooter(ReplacementSource)
		  
		  filecount = 0
		  var oldFile as string
		  
		  for each s as string in ReplacementSource.ListSourceFiles
		    filecount = filecount + 1
		    
		    if filecount > 1 then addFileSepartor(ReplacementSource, oldFile, s, filecount)
		    
		    addFileHeader(ReplacementSource, s, filecount)
		    
		    addMethodDirectoryHeader(ReplacementSource, s, filecount)
		    
		    methodcount = 0
		    for each m  as string in ReplacementSource.ListMethodInSource(s)
		      methodcount = methodcount + 1
		      addFileMethodDirectoryEntry(ReplacementSource, s, m, filecount, methodcount)
		      
		      
		    next
		    
		    var oldMethod as string
		    
		    addmethodDirectoryFooter(ReplacementSource, s, filecount)
		    methodcount = 0
		    for each m  as string in ReplacementSource.ListMethodInSource(s)
		      methodcount = methodcount + 1
		      
		      if filecount > 1 then addMethodSeparator(ReplacementSource,  s, oldmethod,  m, filecount, methodcount)
		      
		      addFileMethodDetails(ReplacementSource, s, m, filecount, methodcount)
		      
		      oldMethod = m
		      
		    next
		    
		    addFileFooter(ReplacementSource, s, filecount)
		    
		    oldFile = s
		    
		  next
		  
		  addDocumentFooter(ReplacementSource)
		  
		  generationEpilogue(ReplacementSource)
		  
		  
		  Return
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		destination As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		Generated As DateTime
	#tag EndProperty

	#tag Property, Flags = &h0
		templates As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		TopLevel As string
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
			Name="TopLevel"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
