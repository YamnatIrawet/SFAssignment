// Dynamic picklist values for lightning component --- 01 May2021
global class MyCustomPicklist_cls extends VisualEditor.DynamicPickList{
    VisualEditor.DesignTimePageContext context;
 
    global MyCustomPicklist_cls(VisualEditor.DesignTimePageContext context) {
       this.context = context;
    }
 
  /*  global override VisualEditor.DataRow getDefaultValue(){
        VisualEditor.DataRow defaultValue = new VisualEditor.DataRow('red', 'RED');
        return defaultValue;
    } */
    global override VisualEditor.DataRow getDefaultValue(){
        VisualEditor.DataRow defaultValue = null;
        return defaultValue;
    }
    global override VisualEditor.DynamicPickListRows getValues() {
        VisualEditor.DynamicPickListRows  myValues = new VisualEditor.DynamicPickListRows();

        if(context.entityName=='Account'){
            myValues.addRow(new VisualEditor.DataRow('US', 'Us'));   
            myValues.addRow(new VisualEditor.DataRow('EMEA', 'Emea')); 
            myValues.addRow(new VisualEditor.DataRow('ASIA', 'Asia')); 
        }
        if(context.entityName=='Contact'){
            myValues.addRow(new VisualEditor.DataRow('INDIA', 'India'));    
            myValues.addRow(new VisualEditor.DataRow('JAPAN', 'Japan'));  
            myValues.addRow(new VisualEditor.DataRow('HONGKONG', 'hongkong'));
            myValues.addRow(new VisualEditor.DataRow('TAIWAN', 'Taiwan'));
        }
        return myValues;
    }
}