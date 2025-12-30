#tag Class
Protected Class clAutoDocGen_html
Inherits clAutoDocGen_Generic
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
		  // Calling the overridden superclass constructor.
		  Super.Constructor(sourceTemplatesFolder, outputDestination, filename, ReplacementSource)
		  
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
		  //  - ReplacementSource: provide information extracted from the results of analysis of the source tree
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
		  
		  if outputDestination.Exists then
		    if outputDestination.IsFolder then
		      outputDestination.RemoveFolderAndContents
		      
		    else
		      outputDestination.Remove
		      
		    end if
		    
		  end if
		  
		  outputDestination.CreateFolder
		  
		  for each  fld as FolderItem in templatesFolder.Children
		    
		    if not fld.IsFolder then
		      
		    elseif fld.Name = "templates" then
		      
		    else
		      CopyFolderTo(fld, outputDestination)
		      
		    end if
		    
		  next
		  
		  
		  return
		  
		End Sub
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
