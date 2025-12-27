#tag Class
Protected Class clAutoDocGenText
Inherits clAutoDocGenGeneric
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
		  output.Add("----------------------------------- end of " + ReplacementSource.Project)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addDocumentHeader(ReplacementSource as clAutodocSourceInfo)
		  output.Add("Project " + ReplacementSource.Project)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addFileFooter(ReplacementSource as clAutodocSourceInfo, filename as string, filecount as integer)
		  output.Add("") 
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addFileHeader(ReplacementSource as clAutodocSourceInfo, filename as string, filecount as integer)
		  
		  output.Add("- File " + filename)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addFileMethodDetails(ReplacementSource as clAutodocSourceInfo, filename as string, methodname as string, filecount as integer, methodcount as integer)
		  
		  output.add("")
		  output.Add("---- Method  " + methodname + "       (from " + filename +")")
		  
		  var mf as clAutoDocMethodInfo = ReplacementSource.getMethodInfo(filename, methodname)
		  
		  output.add("")
		  for each s as string in mf.Description
		    if s.trim.Length > 0 then 
		      output.Add(s.trim)
		      
		    end if
		  next
		  
		  output.add("")
		  output.add("Parameters")
		  for i as integer = 0 to mf.parameterNames.LastIndex
		    output.add("     " + mf.parameterNames(i) + " " + mf.parameterTypes(i))
		    
		  next
		  output.add("")
		  output.add("Returns")
		  if mf.returnType.Trim.Length = 0 then
		    output.add("    "+"(nothing)")
		    
		  else
		    output.Add("    "+mf.returnType)
		    
		  end if
		  
		  output.add("")
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
		Sub Constructor(templates as FolderItem, destination as FolderItem, ReplacementSource as clAutodocSourceInfo)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(templates, destination, ReplacementSource)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub generationEpilogue(ReplacementSource as clAutodocSourceInfo)
		  var ttout as TextOutputStream = TextOutputStream.Create(self.destination)
		  
		  for each s as string in self.output
		    ttout.WriteLine(s)
		    
		  next
		  
		  ttout.Close
		  
		  Return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub generationPrologue(templates as FolderItem, ReplacementSource as clAutodocSourceInfo)
		  
		  self.output.RemoveAll
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		output() As String
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
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
