#tag Class
Protected Class clAutoDocGen_Generic
	#tag Method, Flags = &h0
		Sub addDocumentFooter(ReplacementSource as clAutodocSourceInfo)
		  //  
		  //  Called after all processing
		  //  
		  //  Parameters
		  //  - Replacement source: provide information extracted from the results of analysis of the source tree
		  //  
		  //  Returns:
		  //    
		  //
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addDocumentHeader(ReplacementSource as clAutodocSourceInfo)
		  //  
		  //  Called before any processing
		  //  
		  //  Parameters
		  //  - Replacement source: provide information extracted from the results of analysis of the source tree
		  //  
		  //  Returns:
		  //    
		  //
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addFileDirectoryEntry(ReplacementSource as clAutodocSourceInfo, filename as string, fileIndex as integer)
		  //  
		  //  Called for each entry found in the list of source files, when enumerated to build the directory
		  //  
		  //  Parameters
		  //  - Replacement source: provide information extracted from the results of analysis of the source tree
		  //  - Filename: name of the file
		  //  - FileIndex: index of the file in the list of files
		  //
		  //  Returns:
		  //   
		  //
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addFileDirectoryFooter(ReplacementSource as clAutodocSourceInfo, fileCount as integer)
		  //  
		  //  Called after the enumeration of the list of source files
		  //  
		  //  Parameters
		  //  - Replacement source: provide information extracted from the results of analysis of the source tree
		  //  - FileCount: Number of files in the directory
		  //
		  //  Returns:
		  //   
		  //
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addFileDirectoryHeader(ReplacementSource as clAutodocSourceInfo, fileCount as integer)
		  //  
		  //  Called before the enumeration of the list of source files
		  //  
		  //  Parameters
		  //  - Replacement source: provide information extracted from the results of analysis of the source tree
		  //  - FileCount: Number of files in the directory
		  //
		  //  Returns:
		  //   
		  //
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addFileFooter(ReplacementSource as clAutodocSourceInfo, filename as string, fileIndex as integer)
		  //  
		  //  Called after enumerating the list of methods in a file
		  //  
		  //  Parameters
		  //  - Replacement source: provide information extracted from the results of analysis of the source tree
		  //  - Filename: name of the file
		  //  - FileIndex: index of the file in the list of files
		  //
		  //  Returns:
		  //   
		  //
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addFileHeader(ReplacementSource as clAutodocSourceInfo, filename as string, fileIndex as integer)
		  //  
		  //  Called before enumerating the list of methods in a file
		  //  
		  //  Parameters
		  //  - Replacement source: provide information extracted from the results of analysis of the source tree
		  //  - Filename: name of the file
		  //  - FileIndex: index of the file in the list of files
		  //
		  //  Returns:
		  //   
		  //
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addFileMethodDetails(ReplacementSource as clAutodocSourceInfo, filename as string, methodname as string, fileIndex as integer, methodIndex as integer)
		  //  
		  //  Called to include details of a method
		  //  
		  //  Parameters
		  //  - Replacement source: provide information extracted from the results of analysis of the source tree
		  //  - Filename: name of the file
		  //  - Methodname: name of the method
		  //  - FileIndex: index of the file in the list of files
		  //  - MethodIndex: index of the method in the list of methods of the current file
		  //
		  //  Returns:
		  //   
		  //
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addFileMethodDirectoryEntry(ReplacementSource as clAutodocSourceInfo, filename as string, methodname as string, fileIndex as integer, methodIndex as integer)
		  //  
		  //  Called for each entry found in the list of methods in the current file, when enumerated to build the directory
		  //  
		  //  Parameters
		  //  - Replacement source: provide information extracted from the results of analysis of the source tree
		  //  - Filename: name of the file
		  //  - MethodName: name of the method
		  //  - FileIndex: index of the file in the list of files
		  //  - MethodIndex: index of the method in the list of methods of the current file
		  //
		  //  Returns:
		  //   
		  //
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addFileSepartor(ReplacementSource as clAutodocSourceInfo, previousFilename as string, nextFilename as string, fileIndex as integer)
		  //  
		  //  Called when enumerating the files in the list files between two files
		  //  
		  //  Parameters
		  //  - Replacement source: provide information extracted from the results of analysis of the source tree
		  //  - PreviousFilename: name of the previous file
		  //  - NextFilename: name of the next file
		  //  - FileIndex: index of the next file in the list of files
		  //
		  //  Returns:
		  //   
		  //
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addMethodDirectoryFooter(ReplacementSource as clAutodocSourceInfo, filename as string, fileIndex as integer, methodCount as Integer)
		  //  
		  //  Called after the enumeration of the methods in the directory
		  //  
		  //  Parameters
		  //  - Replacement source: provide information extracted from the results of analysis of the source tree
		  //  - Filename: name of the file
		  //  - FileIndex: index of the file in the list of files
		  //  - MethodCount: number of methods in the directory
		  //
		  //  Returns:
		  //   
		  //
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addMethodDirectoryHeader(ReplacementSource as clAutodocSourceInfo, filename as string, fileIndex as integer, methodCount as integer)
		  //  
		  //  Called before the enumeration of the methods in the directory
		  //  
		  //  Parameters
		  //  - Replacement source: provide information extracted from the results of analysis of the source tree
		  //  - Filename: name of the file
		  //  - FileIndex: index of the file in the list of files
		  //  - MethodCount: number of methods in the directory
		  //
		  //  Returns:
		  //   
		  //
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addMethodSeparator(ReplacementSource as clAutodocSourceInfo, Filename as string, previousMethodname as string, nextMethodname as string, fileIndex as integer, methodIndex as integer)
		  //  
		  //  Called when enumerating the files in the list files between two files
		  //  
		  //  Parameters
		  //  - Replacement source: provide information extracted from the results of analysis of the source tree
		  //  - Filename: name of the file
		  //  - previousMethodName: name of the previous method
		  //  - nextMethodName: name of the next method
		  //  - FileIndex: index of the file in the list of files
		  //  - MethodIndex:  index of the method in the list of methods of the current file
		  //
		  //  Returns:
		  //   
		  //
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(sourceTemplatesFolder as FolderItem, outputDestination as FolderItem, filename as string, ReplacementSource as clAutodocSourceInfo = nil)
		  //
		  // Initialize the generator. 
		  // Launch the generator if the SourceInfo is provided 
		  // 
		  //  Parameters:
		  // -  sourceTemplate: folder where assets required for the generation process are stored
		  // -  outputDestination: reference to the file or folder where output is generated
		  // -  Filename
		  // -  ReplacementSource: provide information extracted from the results of analysis of the source tree (optional)
		  //
		  
		  self.templatesFolder = sourceTemplatesFolder
		  
		  self.destinationFolder = outputDestination
		  self.destinationFileName = filename
		  
		  if ReplacementSource = nil then 
		    
		  else
		    ProcessSourceFiles(ReplacementSource)
		    
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub CopyFolderTo(source as FolderItem, destination as FolderItem)
		  var fld as FolderItem = destination.Child(source.name)
		  
		  fld.CreateFolder
		  
		  for each file as FolderItem in source.Children
		    
		    var binStream as BinaryStream 
		    var outfile as FolderItem 
		    var allbytes as string
		    
		    binStream = BinaryStream.Open(file, false)
		    allbytes = binStream.Read(file.Length)
		    binStream.Close
		    
		    outfile = fld.Child(file.Name)
		    
		    binStream = BinaryStream.Create(outfile)
		    binStream.Write(allbytes)
		    binStream.close
		    
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub generationEpilogue(templatesFolder as FolderItem, outputDestination as FolderItem, filename as string, ReplacementSource as clAutodocSourceInfo)
		  //  
		  //  Called after anything else, used to close the generation process
		  //  
		  //  Parameters
		  //  - Templates: location of templates (if any used)
		  //  - outputDestination: destination folder
		  //  - Filename: template for filename
		  //  - Replacement source: provide information extracted from the results of analysis of the source tree
		  //  
		  //  Returns:
		  //   
		  //
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub generationPrologue(templatesFolder as FolderItem, outputDestination as FolderItem, filename as string, ReplacementSource as clAutodocSourceInfo)
		  //  
		  //  Called before anything else, used to prepare the generation process
		  //  
		  //  Parameters
		  //  - Templates: location of templates (if any used)
		  //  - outputDestination: destination folder
		  //  - Filename: template for filename
		  //  - Replacement source: provide information extracted from the results of analysis of the source tree
		  //  
		  //  Returns:
		  //   
		  //
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub processSourceFiles(ReplacementSource as clAutodocSourceInfo)
		  //
		  // Executes the generation process
		  //
		  //  Parameters
		  // -  ReplacementSource: provide information extracted from the results of analysis of the source tree
		  //
		  
		  var filecount as integer
		  var methodcount as integer
		  
		  generationPrologue(self.templatesFolder, self.destinationFolder, self.destinationFileName, ReplacementSource)
		  
		  addDocumentHeader(ReplacementSource)
		  
		  addFileDirectoryHeader(ReplacementSource, ReplacementSource.ListSourceFiles.Count)
		  
		  filecount = 0
		  for each s as string in ReplacementSource.ListSourceFiles
		    filecount = filecount + 1
		    addFileDirectoryEntry(ReplacementSource, s, filecount)
		    
		  next
		  
		  addFileDirectoryFooter(ReplacementSource, ReplacementSource.ListSourceFiles.Count)
		  
		  filecount = 0
		  var oldFile as string
		  
		  for each s as string in ReplacementSource.ListSourceFiles
		    filecount = filecount + 1
		    
		    if filecount > 1 then addFileSepartor(ReplacementSource, oldFile, s, filecount)
		    
		    addFileHeader(ReplacementSource, s, filecount)
		    
		    addMethodDirectoryHeader(ReplacementSource, s, filecount, ReplacementSource.ListMethodInSource(s).count)
		    
		    methodcount = 0
		    for each m  as string in ReplacementSource.ListMethodInSource(s)
		      methodcount = methodcount + 1
		      addFileMethodDirectoryEntry(ReplacementSource, s, m, filecount, methodcount)
		      
		    next
		    
		    var oldMethod as string
		    
		    addmethodDirectoryFooter(ReplacementSource, s, filecount, ReplacementSource.ListMethodInSource(s).count)
		    
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
		  
		  generationEpilogue(self.templatesFolder, self.destinationFolder, self.destinationFileName, ReplacementSource)
		  
		  Return
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private destinationFileName As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private destinationFolder As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		Generated As DateTime
	#tag EndProperty

	#tag Property, Flags = &h21
		Private templatesFolder As FolderItem
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
