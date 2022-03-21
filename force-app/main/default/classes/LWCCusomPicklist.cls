global class LWCCusomPicklist extends VisualEditor.DynamicPickList{
    
    global override VisualEditor.DataRow getDefaultValue(){
        VisualEditor.DataRow defaultValue = new VisualEditor.DataRow('Red', 'Red');
        return defaultValue;
    }
    global override VisualEditor.DynamicPickListRows getValues() {
        VisualEditor.DataRow value1 = new VisualEditor.DataRow('Yellow', 'Yellow');
        VisualEditor.DataRow value2 = new VisualEditor.DataRow('Green', 'Green');
        VisualEditor.DataRow value3 = new VisualEditor.DataRow('Black', 'Black');
        VisualEditor.DataRow value4 = new VisualEditor.DataRow('Red','Red');

        VisualEditor.DynamicPickListRows  myValues = new VisualEditor.DynamicPickListRows();

        myValues.addRow(value1);
        myValues.addRow(value2);
        myValues.addRow(value3);

        myValues.addRow(value4);


        return myValues;
    }
}