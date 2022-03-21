public class MapDemo {
    public MapDemo(){
        Map<String,String> keyToColorMap= new Map<String,String>();
        keyToColorMap.put('key1','Green');
        keyToColorMap.put('key2','Blue');
        keyToColorMap.put('key3','Yellow');
        keyToColorMap.put('key4','Black');
        // map print
        System.debug('Map is '+keyToColorMap);
        //size
        System.debug('Map size is '+keyToColorMap.size());
        //get key value from map
        System.debug('color value at key2'+keyToColorMap.get('key2'));
        //change value of a key
        keyToColorMap.put('key2','Orange');
        System.debug('color value at key2'+keyToColorMap.get('key2'));
        Set<String> colorKeySet=keyToColorMap.keySet();
        //all keys
        System.debug('color keys are: '+colorKeySet);
        List<String> colorValueList=keyToColorMap.values();
        //all values i a from of list
        System.debug('color values are: '+colorValueList);
        //iteration over map
        for(String key:keyToColorMap.keySet())
        {
            System.debug('value at key :'+key+' is :'+keyToColorMap.get(key));
        }
        //to check contains
        System.debug('do map have key3'+keyToColorMap.containsKey('key3'));
        //clear map
        keyToColorMap.clear();
        System.debug('map size '+keyToColorMap.size());
        
        

    }

}