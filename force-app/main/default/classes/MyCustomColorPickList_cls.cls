global class MyCustomColorPickList_cls  extends VisualEditor.DynamicPickList{
    VisualEditor.DesignTimePageContext context;
    public MyCustomColorPickList_cls(VisualEditor.DesignTimePageContext context) {
        this.context = context;
    }
    global override VisualEditor.DataRow getDefaultValue(){
        VisualEditor.DataRow defaultValue = new VisualEditor.DataRow('red', 'RED');
        return defaultValue;
    }
    global override VisualEditor.DynamicPickListRows getValues() {
        VisualEditor.DataRow value1 = new VisualEditor.DataRow('red', 'RED');
        VisualEditor.DataRow value2 = new VisualEditor.DataRow('yellow', 'YELLOW');
        VisualEditor.DynamicPickListRows  myValues = new VisualEditor.DynamicPickListRows();
        myValues.addRow(value1);
        myValues.addRow(value2);
 
        if (context.pageType == 'HomePage') {
            VisualEditor.DataRow value3 = new VisualEditor.DataRow('purple', 'PURPLE');
            myValues.addRow(value3);
        }

        if(context.pageType=='RecordPage'){
            VisualEditor.DataRow value3 = new VisualEditor.DataRow('green', 'GREEN');
            myValues.addRow(value3);    
        }
        if(context.entityName=='Contact'){
            VisualEditor.DataRow value3 = new VisualEditor.DataRow('black', 'BLACK');
            myValues.addRow(value3);   
        }
        if(context.entityName=='Account'){
            VisualEditor.DataRow value3 = new VisualEditor.DataRow('cyan', 'CYAN');
            myValues.addRow(value3);    
        }
        return myValues;
    }

}