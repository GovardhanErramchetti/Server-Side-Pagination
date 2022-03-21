global class MyCustomPicklist extends VisualEditor.DynamicPickList{
    
    global override VisualEditor.DataRow getDefaultValue(){
        VisualEditor.DataRow defaultValue = new VisualEditor.DataRow('red', 'RED');
        return defaultValue;
    }
    global override VisualEditor.DynamicPickListRows getValues() {
        VisualEditor.DataRow value1 = new VisualEditor.DataRow('yyyy.MMMM.dd hh:mm a', 'yyyy.MMMM.dd hh:mm a');
        VisualEditor.DataRow value2 = new VisualEditor.DataRow('EEE, MMM d, \'\'yy','EEE, MMM d,\'\'yy');
        VisualEditor.DataRow value3 = new VisualEditor.DataRow('yyMMddHHmmssZ', 'yyMMddHHmmssZ');
        VisualEditor.DataRow value4 = new VisualEditor.DataRow('EEE, d MMM yyyy HH:mm:ss Z','EEE, d MMM yyyy HH:mm:ss Z');

        VisualEditor.DynamicPickListRows  myValues = new VisualEditor.DynamicPickListRows();

        myValues.addRow(value1);
        myValues.addRow(value2);
        myValues.addRow(value3);

        myValues.addRow(value4);


        return myValues;
    }
}