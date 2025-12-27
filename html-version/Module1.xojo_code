#tag Module
Protected Module Module1
	#tag Method, Flags = &h0
		Function get(extends v() as string, index as Integer) As string
		  if v.LastIndex >= index then
		    return v(index)
		    
		  else
		    return ""
		    
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getSelectedRowsAsTable(extends t as clDataTable, selectedrowindex() as integer) As clDataTable
		  
		  var return_table as new clDataTable("Extract from "+ t.Name)
		  
		  for each index as integer in selectedrowindex
		    
		    return_table.AddRow(t.GetRowAt(index, false))
		    
		  next
		  
		  return return_table
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub run_test()
		  var t() as string
		  
		  //t.Add "#tag Class"
		  //t.add "         #tag Method, Flags = &h0"
		  t.Add "               Function GetDatabase() As Database"
		  t.Add "                    return db"
		  t.Add "               End Function"
		  //t.Add "         #tag EndMethod"
		  //t.Add  "#tag EndClass"
		  
		  var v1 as new clAutoDocMethod("alpha")
		  
		  for each tt as string in t
		    v1.AddSourceLine(tt)
		    
		  next
		  
		  v1.ParseSourceCode
		  
		  
		  
		  t.RemoveAll
		  
		  t.add("Function BasicFieldFilter(pRowIndex as integer, pRowCount as integer, pColumnNames() as string, pCellValues() as variant, paramarray pFunctionParameters as variant) As Boolean")
		  t.add("  //  ")
		  t.add("//  Implementation of basic RowFilter to compare the value of a cell in a column (name as paramter #0) to a constant value (paramter #1)")
		  t.add("  //  ")
		  t.add("  //  Parameters")
		  t.add("  //  - pRowIndex: index of the current row")
		  t.add("  //  - pRowCount: number of rows in the table")
		  t.add("  //  - pColumnNames(): list of columns in in the table")
		  t.add("  //  - pCellValues(): values of the columns for the current row")
		  t.add("  //  - pFunctionParameters: additional paramters used to defined the bahaviour of the function")
		  t.add("  //     In this implementation:")
		  t.add("//     - parameter #0 is the name of the column")
		  t.add("//    -  parameter #1 is the expected value")
		  t.add("  //  ")
		  t.add("  //  Returns:")
		  t.add("  //   - boolean: results of comparision, true if the value in the column matches the expected value")
		  t.add("  //  ")
		  t.add("var FieldName as string = pFunctionParameters(0)")
		  t.add("var FieldValue as variant = pFunctionParameters(1)")
		  t.add("  ")
		  t.add("  var idx as integer = pColumnNames.IndexOf(FieldName)")
		  t.add("  ")
		  t.add("  if FieldValue.IsArray then")
		  t.add("    var va() as variant = ExtractVariantArray(FieldValue)")
		  t.add("    ")
		  t.add("    for each v as variant in va")
		  t.add("      if pCellValues(idx) = v then return true")
		  t.add("      ")
		  t.add("    next")
		  t.add("    return False")
		  t.add("    ")
		  t.add("  else")
		  t.add("    return pCellValues(idx) = FieldValue")
		  t.add("    ")
		  t.add("  end if")
		  t.add("  ")
		  t.add("End Function")
		  t.add("")
		  
		  var v2 as new clAutoDocMethod("alpha")
		  
		  for each tt as string in t
		    v2.AddSourceLine(tt)
		    
		  next
		  
		  v2.ParseSourceCode
		  
		  
		  return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowTableInListbox(thetable as TableColumnReaderInterface, thelist as DesktopListBox)
		  
		  var tmp_listbox as DesktopListBox = thelist
		  var tmp_tbl as TableColumnReaderInterface = thetable
		  
		  
		  var nbr_columns as integer = tmp_tbl.ColumnCount
		  
		  tmp_listbox.RemoveAllRows
		  
		  //  
		  //  update table header
		  //  
		  tmp_listbox.HasHeader = True
		  
		  tmp_listbox.ColumnCount = nbr_columns + 1
		  
		  tmp_listbox.HeaderAt(0)="#"
		  tmp_listbox.ColumnWidths = "64,"
		  
		  for column_index as integer = 0 to  nbr_columns-1
		    tmp_listbox.HeaderAt(column_index+1) = tmp_tbl.GetColumnAt(column_index).DisplayTitle
		    tmp_listbox.ColumnTagAt(column_index+1) = tmp_tbl.GetColumnAt(column_index)
		  next
		  
		  //  
		  //  show data
		  //  
		  var tmp_last_row as integer = tmp_tbl.RowCount
		  
		  for row_index as integer = 0 to tmp_last_row - 1
		    tmp_listbox.AddRow(str(row_index))
		    
		  next
		  
		  
		  for column_index as integer = 0 to  nbr_columns-1
		    var tmp_col as clAbstractDataSerie = tmp_tbl.GetColumnAt(column_index)
		    
		    for  row_index as integer = 0 to tmp_last_row - 1
		      
		      tmp_listbox.CellTextAt(row_index, column_index+1) =  tmp_col.GetElementAsString(row_index)
		      
		    next
		    
		  next
		  
		  
		  
		  
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
	#tag EndViewBehavior
End Module
#tag EndModule
