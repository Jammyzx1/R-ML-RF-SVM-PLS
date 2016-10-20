Sub Analyses_ML_outputs()
'
' Analyses_ML_outputs Macro
'

'
    Range("A11").Select
    Selection.EntireRow.Insert
    Range("A21").Select
    Selection.EntireRow.Insert
    ActiveWindow.SmallScroll Down:=8
    Range("A31").Select
    Selection.EntireRow.Insert
    ActiveWindow.SmallScroll Down:=10
    Range("A41").Select
    Selection.EntireRow.Insert
    ActiveWindow.SmallScroll Down:=6
    Range("A51").Select
    Selection.EntireRow.Insert
    ActiveWindow.SmallScroll Down:=8
    Range("A61").Select
    Selection.EntireRow.Insert
    ActiveWindow.SmallScroll Down:=3
    Range("A71").Select
    Selection.EntireRow.Insert
    ActiveWindow.SmallScroll Down:=28
    Range("A81").Select
    Selection.EntireRow.Insert
    Range("A91").Select
    Selection.EntireRow.Insert
    ActiveWindow.SmallScroll Down:=-102
    Range("F10").Select
    ActiveCell.FormulaR1C1 = "=COUNT(R[-8]C[-1]:RC[-1])"
    Range("F10").Select
    Selection.Copy
    Range("F20").Select
    ActiveSheet.Paste
    ActiveWindow.SmallScroll Down:=5
    Range("F30").Select
    ActiveSheet.Paste
    ActiveWindow.SmallScroll Down:=6
    Range("F40").Select
    ActiveSheet.Paste
    ActiveWindow.SmallScroll Down:=7
    Range("F50").Select
    ActiveSheet.Paste
    ActiveWindow.SmallScroll Down:=8
    Range("F60").Select
    ActiveSheet.Paste
    ActiveWindow.SmallScroll Down:=9
    Range("F70").Select
    ActiveSheet.Paste
    ActiveWindow.SmallScroll Down:=10
    Range("F80").Select
    ActiveSheet.Paste
    ActiveWindow.SmallScroll Down:=10
    Range("F90").Select
    ActiveSheet.Paste
    ActiveWindow.SmallScroll Down:=9
    Range("F100").Select
    ActiveSheet.Paste
    ActiveWindow.SmallScroll Down:=-98
    ActiveWindow.SmallScroll ToRight:=-1
    ActiveWindow.SmallScroll Down:=-7
    Range("F10,F20,F30").Select
    Range("F30").Activate
    ActiveWindow.SmallScroll Down:=23
    Range("F10,F20,F30,F40,F50,F60").Select
    Range("F60").Activate
    ActiveWindow.SmallScroll Down:=30
    Range("F10,F20,F30,F40,F50,F60,F70,F80,F90").Select
    Range("F90").Activate
    ActiveWindow.SmallScroll Down:=15
    Range("F10,F20,F30,F40,F50,F60,F70,F80,F90,F100").Select
    Range("F100").Activate
    Selection.FormatConditions.Add Type:=xlCellValue, Operator:=xlNotEqual, _
        Formula1:="=9"
    Selection.FormatConditions(Selection.FormatConditions.Count).SetFirstPriority
    With Selection.FormatConditions(1).Interior
        .PatternColorIndex = xlAutomatic
        .ColorIndex = xlAutomatic
    End With
    Selection.FormatConditions(1).StopIfTrue = False
    ActiveWindow.SmallScroll Down:=-108
    Range("J1").Select
    ActiveCell.FormulaR1C1 = "RF"
    Range("K1").Select
    ActiveCell.FormulaR1C1 = "SD"
    Range("L1").Select
    ActiveCell.FormulaR1C1 = "SVM"
    Range("M1").Select
    ActiveCell.FormulaR1C1 = "SD"
    Range("N1").Select
    ActiveCell.FormulaR1C1 = "PLS"
    Range("O1").Select
    ActiveCell.FormulaR1C1 = "SD"
    Range("I1").Select
    ActiveCell.FormulaR1C1 = "Data/Measure"
    Range("I2").Select
    ActiveCell.FormulaR1C1 = "CDK R2"
    Range("I3").Select
    ActiveCell.FormulaR1C1 = "CDK RMSE"
    Range("J2").Select
    ActiveCell.FormulaR1C1 = _
        "=AVERAGE(R[4]C[-5],R[14]C[-5],R[24]C[-5],R[34]C[-5],R[44]C[-5],R[54]C[-5],R[64]C[-5],R[74]C[-5],R[84]C[-5],R[94]C[-5])"
    Range("J3").Select
    ActiveWindow.SmallScroll Down:=-5
    ActiveCell.FormulaR1C1 = _
        "=AVERAGE(R[2]C[-5],R[12]C[-5],R[22]C[-5],R[32]C[-5],R[42]C[-5],R[52]C[-5],R[62]C[-5],R[72]C[-5],R[82]C[-5],R[92]C[-5])"
    Range("J4").Select
    ActiveWindow.SmallScroll Down:=-39
    Range("K2").Select
    ActiveCell.FormulaR1C1 = _
        "=STDEV.S(R[4]C[-6],R[14]C[-6],R[24]C[-6],R[34]C[-6],R[44]C[-6],R[54]C[-6],R[64]C[-6],R[74]C[-6],R[84]C[-6],R[94]C[-6])"
    Range("K3").Select
    ActiveWindow.SmallScroll Down:=-10
    ActiveCell.FormulaR1C1 = _
        "=STDEV.S(R[2]C[-6],R[12]C[-6],R[22]C[-6],R[32]C[-6],R[42]C[-6],R[52]C[-6],R[62]C[-6],R[72]C[-6],R[82]C[-6],R[92]C[-6])"
    Range("K4").Select
    ActiveWindow.SmallScroll Down:=-19
    Range("L2").Select
    ActiveCell.FormulaR1C1 = _
        "=AVERAGE(R[1]C[-7],R[11]C[-7],R[21]C[-7],R[31]C[-7],R[41]C[-7],R[51]C[-7],R[61]C[-7],R[71]C[-7],R[81]C[-7],R[91]C[-7])"
    Range("L3").Select
    ActiveWindow.SmallScroll Down:=-5
    ActiveWindow.SmallScroll ToRight:=-1
    ActiveWindow.SmallScroll Down:=-18
    ActiveWindow.SmallScroll ToRight:=0
    ActiveCell.FormulaR1C1 = _
        "=AVERAGE(R[-1]C[-7],R[9]C[-7],R[19]C[-7],R[29]C[-7],R[39]C[-7],R[49]C[-7],R[59]C[-7],R[69]C[-7],R[79]C[-7],R[89]C[-7])"
    Range("L4").Select
    ActiveWindow.SmallScroll Down:=-46
    Range("M2").Select
    ActiveCell.FormulaR1C1 = _
        "=STDEV.S(R[1]C[-8],R[11]C[-8],R[21]C[-8],R[31]C[-8],R[41]C[-8],R[51]C[-8],R[61]C[-8],R[71]C[-8],R[81]C[-8],R[91]C[-8])"
    Range("M3").Select
    ActiveWindow.SmallScroll Down:=-40
    ActiveCell.FormulaR1C1 = _
        "=STDEV.S(R[-1]C[-8],R[9]C[-8],R[19]C[-8],R[29]C[-8],R[39]C[-8],R[49]C[-8],R[59]C[-8],R[69]C[-8],R[79]C[-8],R[89]C[-8])"
    Range("M4").Select
    ActiveWindow.SmallScroll Down:=-29
    Range("N2").Select
    ActiveCell.FormulaR1C1 = _
        "=AVERAGE(R[7]C[-9],R[17]C[-9],R[27]C[-9],R[37]C[-9],R[47]C[-9],R[57]C[-9],R[67]C[-9],R[77]C[-9],R[87]C[-9],R[97]C[-9])"
    Range("N3").Select
    ActiveWindow.SmallScroll Down:=-21
    ActiveCell.FormulaR1C1 = _
        "=AVERAGE(R[5]C[-9],R[15]C[-9],R[25]C[-9],R[35]C[-9],R[45]C[-9],R[55]C[-9],R[65]C[-9],R[75]C[-9],R[85]C[-9],R[95]C[-9])"
    Range("N4").Select
    ActiveWindow.SmallScroll Down:=-7
    Range("O2").Select
    ActiveCell.FormulaR1C1 = _
        "=STEDEV.S(R[7]C[-10],R[17]C[-10],R[27]C[-10],R[37]C[-10],R[47]C[-10],R[57]C[-10],R[67]C[-10],R[77]C[-10],R[87]C[-10],R[97]C[-10])"
    Range("O2").Select
    ActiveCell.FormulaR1C1 = _
        "=STDEV.S(R[7]C[-10],R[17]C[-10],R[27]C[-10],R[37]C[-10],R[47]C[-10],R[57]C[-10],R[67]C[-10],R[77]C[-10],R[87]C[-10],R[97]C[-10])"
    Range("O3").Select
    ActiveCell.FormulaR1C1 = _
        "=STDEV.S(R[5]C[-10],R[15]C[-10],R[25]C[-10],R[35]C[-10],R[45]C[-10],R[55]C[-10],R[65]C[-10],R[75]C[-10],R[85]C[-10],R[95]C[-10])"
    Range("O4").Select
    ActiveWindow.SmallScroll Down:=-46
    Range("I7").Select
    ActiveCell.FormulaR1C1 = "=R[-6]C"
    Range("I7").Select
    Selection.AutoFill Destination:=Range("I7:I9"), Type:=xlFillDefault
    Range("I7:I9").Select
    Range("J7").Select
    ActiveCell.FormulaR1C1 = "=CONCATENATE(R[-6]C,"" +/- "",R[-6]C[1])"
    Range("J8").Select
    ActiveCell.FormulaR1C1 = "=CONCATENATE(R[-6]C,"" +/- "",R[-6]C[1])"
    Range("J8").Select
    ActiveCell.FormulaR1C1 = _
        "=CONCATENATE(ROUND(R[-6]C,2),"" +/- "",ROUND(R[-6]C[1],2))"
    Range("J8").Select
    Selection.AutoFill Destination:=Range("J8:J9"), Type:=xlFillDefault
    Range("J8:J9").Select
    Range("K7").Select
    ActiveCell.FormulaR1C1 = "=CONCATENATE(R[-6]C[1],"" +/- "",R[-6]C[2])"
    Range("K7").Select
    Selection.AutoFill Destination:=Range("K7:K8"), Type:=xlFillDefault
    Range("K7:K8").Select
    Range("K8").Select
    ActiveCell.FormulaR1C1 = _
        "=CONCATENATE(ROUND(R[-6]C[1],2),"" +/- "",ROUND(R[-6]C[2],2))"
    Range("K8").Select
    Selection.AutoFill Destination:=Range("K8:K9"), Type:=xlFillDefault
    Range("K8:K9").Select
    Range("L7").Select
    ActiveCell.FormulaR1C1 = "=CONCATENATE(R[-6]C[2],"" +/- "",R[-6]C[3])"
    Range("L8").Select
    ActiveCell.FormulaR1C1 = _
        "=CONCATENATE(ROUND(R[-6]C[2],2),"" +/- "",ROUND(R[-6]C[3],2))"
    Range("L8").Select
    Selection.AutoFill Destination:=Range("L8:L9"), Type:=xlFillDefault
    Range("L8:L9").Select
    Range("L12").Select
End Sub
