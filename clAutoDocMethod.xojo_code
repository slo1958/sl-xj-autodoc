#tag Class
Protected Class clAutoDocMethod
Inherits clAutoDocElement
	#tag Method, Flags = &h0
		Function GetInfoTable() As clDataTable
		  //
		  // Create output table with information about the method
		  //
		  // Paramters:
		  // (none)
		  // 
		  // Returns:
		  // populated datatable
		  //
		  
		  var c1 as new clStringDataSerie(kSource)
		  var c2 as new clStringDataSerie(kType)
		  var c3 as new clStringDataSerie(kRowType)
		  var c6 as new clStringDataSerie(kParentName)
		  var c4 as new clStringDataSerie(kName)
		  var c5 as new clStringDataSerie(kDescription)
		  
		  var t as new clDataTable("Doc", array(c1, c2, c3, c6, c4, c5))
		  
		  var r as clDataRow
		  
		  r = new clDataRow()
		  r.Cell(kType) = kTypeMethod
		  r.Cell(kRowType) = "M" 
		  r.Cell(kName) = self.MethodName
		  r.Cell(kParentName) = self.MethodName
		  r.Cell(kDescription) = self.MethodType
		  
		  t.AddRow(r)
		  
		  
		  for i as integer = 0 to self.Description.LastIndex
		    r = new clDataRow()
		    r.Cell(kType) = kTypeMethod
		    r.Cell(kParentName) = self.MethodName
		    r.Cell(kRowType) = "M" + format(i, "00")
		    r.Cell(kDescription) = self.Description(i)
		    
		    t.AddRow(r)
		    
		  next
		  
		  for i as integer = 0 to ParameterType.LastIndex
		    r = new clDataRow()
		    r.Cell(kType) = kTypeMethod
		    r.Cell(kParentName) = self.MethodName
		    r.Cell(kRowType) = "P" + format(i, "00") 
		    
		    r.Cell(kName) = self.ParameterType(i)
		    
		    if i <= self.ParameterDescription.LastIndex Then r.Cell(kDescription) = self.ParameterDescription(i)
		    
		    t.AddRow(r)
		    
		  next
		  
		  r = new clDataRow()
		  r.Cell(kType) = kTypeMethod
		  r.Cell(kParentName) = self.MethodName
		  r.Cell(kRowType) = "R" 
		  r.Cell(kName) = self.ReturnType
		  r.Cell(kDescription) = self.ReturnDescription
		  
		  t.AddRow(r)
		  
		  
		  return t
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetParameterInfo() As pair()
		  //
		  // Extract information about the parameters of the current method
		  //
		  // Parameters:
		  // (noting)
		  //
		  // Returns:
		  // array of pairs with parameter declaration from the method prototype and the description found in the comments
		  //
		  
		  var ret() as pair
		  for i as integer = 0 to self.ParameterType.LastIndex
		    
		    if i <= Self.ParameterDescription.LastIndex then
		      ret.add(pair(self.ParameterType(i) : self.ParameterDescription(i) ) )
		      
		    end if
		    
		  next
		  
		  return ret
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetReturnInfo() As pair
		  //
		  // Extract information about the value returned by the current method
		  //
		  // Parameters:
		  // (noting)
		  //
		  // Returns:
		  // pair with the declaration of the returned value from the method prototype and the description found in the comments
		  //
		  return pair(self.ReturnType: self.ReturnDescription)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ParsePrototype()
		  //
		  // Process the method prototype to extract the list of parameters and the type of returned value, if any
		  //
		  // Parameters:
		  // (noting)
		  //
		  // Returns:
		  // (nothing)
		  //
		  
		  const kAsStr as string = " as "
		  var s as String = self.Prototype
		  var p as string = self.Prototype
		  
		  s = s.trim
		  
		  // 
		  // Find the name of the method
		  //
		  var idx as integer
		  
		  var pats() as string = array("Shared Sub", "Shared Function","Sub", "Function")
		  
		  for each pat as string in pats
		    idx = s.IndexOf(pat)
		    
		    if idx < 3 and idx >-1 then
		      self.MethodType = s.left(idx + pat.Length)
		      
		      s = s.mid( idx + pat.Length + 1, 999).Trim
		      
		    end if
		  next
		  
		  var indexParent as integer = s.indexof( "(")
		  
		  self.MethodName = s.left(indexParent)
		  
		  
		  //
		  // Extract the parameters, if any
		  //
		  var stemp as string = s.mid(indexParent+1,999).trim
		  
		  if stemp.left(2)= "()" then // no parameters
		    self.ReturnType = stemp.replace("() as ","").trim
		    
		    
		  else
		    var temp() as string = stemp.Split(",")
		    
		    if temp.LastIndex >= 0 then
		      if temp(0).left(1) = "(" then temp(0) = temp(0).mid(2,999).trim
		      
		      
		      var indexAs1 as integer = temp(temp.LastIndex).IndexOf(" as ")
		      var indexAs2 as integer = temp(temp.LastIndex).IndexOf(indexAs1+1, " as ")
		      
		      if indexAs2 > 0 then // split the return type
		        self.ReturnType = temp(temp.LastIndex).mid(indexAs2+4, 999).trim
		        
		        temp(temp.LastIndex) = temp(temp.LastIndex).left(indexas2).trim
		        
		        
		      end if
		      
		      if temp(temp.LastIndex).right(1) = ")" then  temp(temp.LastIndex) = temp(temp.LastIndex).left(temp(temp.LastIndex).Length-1).trim
		      
		      
		    end if
		    
		    for i as integer = 0 to temp.LastIndex
		      temp(i) = temp(i).trim
		    next
		    
		    self.ParameterType = temp
		  end if
		  
		  return 
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ParseSourceCode()
		  //
		  // Parse the collected source line to extract information about the current method
		  //
		  // Parameters:
		  // (nothing)
		  //
		  // Returns:
		  // (nohting)
		  //
		  const kParams as string  = "Parameters"
		  const kReturn as string = "Returns"
		  
		  var ret_desc() as string
		  var ret_param() as string
		  var ret_return() as string
		  
		  var part as integer = 0
		  var lineIndex as integer = 1 // skip prototype
		  
		  while lineIndex <= SourceLines.LastIndex and SourceLines(lineIndex).trim.left(2)= "//" 
		    var indexParams as integer = SourceLines(lineIndex).trim.IndexOf(kParams)
		    var indexReturns as integer = SourceLines(lineIndex).trim.IndexOf(kReturn)
		    
		    if indexParams < 6 and indexParams > 0 then
		      part = 1
		      
		    elseif indexReturns < 6  and indexReturns > 0 then
		      part = 2
		      
		    else
		      select case part
		      case 0
		        ret_desc.add(SourceLines(lineIndex).replace("//","").replace("-","").trim)
		        
		      case 1 
		        if SourceLines(lineIndex).trim <> "//" then ret_param.Add(SourceLines(lineIndex).replace("//","").replace("-","").trim)
		        
		      case 2
		        if SourceLines(lineIndex).trim <> "//" then ret_return.add(SourceLines(lineIndex))
		        
		      case else
		        
		      end select
		      
		    end if
		    
		    lineIndex = lineIndex + 1
		  wend
		  
		  
		  self.Description = ret_desc
		  self.ReturnDescription = string.FromArray(ret_return," ").replace("//","").replace("-","").trim
		  self.ParameterDescription = ret_param
		  
		  ParsePrototype()
		   
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Prototype() As string
		  //
		  // returs the prototype of the current method
		  // Assumed to be the first line of the declaration found in the source code
		  //
		  // Parameters:
		  // (nothing)
		  //
		  // Returns:
		  // prototype oif the method as a string
		  //
		  return self.SourceLines(0)
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Description() As string
	#tag EndProperty

	#tag Property, Flags = &h0
		MethodName As string
	#tag EndProperty

	#tag Property, Flags = &h0
		MethodType As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ParameterDescription() As string
	#tag EndProperty

	#tag Property, Flags = &h0
		ParameterType() As string
	#tag EndProperty

	#tag Property, Flags = &h0
		ReturnDescription As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ReturnType As String
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
			Name="MainTag"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MethodName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MethodType"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ReturnDescription"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ReturnType"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
