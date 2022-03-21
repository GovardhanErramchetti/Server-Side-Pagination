public class ListDemo {
    public ListDemo()
    {
        List<String> colorList=new List<String>();
        colorList.add('Red');
        colorList.add('Green');
        colorList.add('Yellow');
        System.debug('List is:'+colorList);
        System.debug('List size is:'+colorList.size());
        colorList.add('Red');
        System.debug('List size is:'+colorList.size());
        System.debug('color at index 1 is'+colorList.get(0));
        List<String> tempList=new List<String>();
        tempList.add('blue');
        tempList.add('orange');
        colorList.addAll(tempList);
        for(Integer index=0;index<colorList.size();index++)
        {
            System.debug('###Color at Index '+index+' is :'+colorList.get(index));
            
        }
        Integer index=0;
        for(String colorName:colorList)
        {
            System.debug('@@@Color at Index '+index+' is :'+colorName );
            index++;
        }
        
        
        
        colorList.clear();       
        System.debug('List size is:'+colorList.size());

        
        

    }

}