public class SetDemo {
	public SetDemo()
    {
           
    	Set<String> colorSet= new Set<String>();
        colorSet.add('Blue');
        colorSet.add('Yellow');
        colorSet.add('Green');
        System.debug('List is  '+colorSet);
        Integer setSize=colorSet.size();
        System.debug('Set size is '+setSize);
        colorSet.add('Yellow'); 
        System.debug('Set size is '+colorSet.size());
        colorSet.add('BLUE');
        System.debug('Set size is '+colorSet.size());
        System.debug('Does set contain Green?'+colorSet.contains('Green'));
        System.debug('Does set contain Red?'+colorSet.contains('Red'));
        
        Set<String> tempSet=new Set<String>();
        tempSet.add('Red');
        tempSet.add('Cyan');
        
        colorSet.addAll(tempSet);
        for(String col: colorSet){
             System.debug('Elements in set are '+col);
        }
    }
    public static void preventSetOfObjects()
    {
        Account account1=new Account();
        account1.Name='Test';
        insert account1;
        System.debug('>>>>Account 1'+account1);
        Set<Account> accountSet=new Set<Account>();
        accountSet.add(account1);
        System.debug('...accountSet is'+accountSet+'  ,,,size is'+accountSet.size());
        System.debug('accounthere or not'+accountSet.contains(account1));
        Account account2=new Account();
        account2.Id=account1.Id;
        account2.Name='Test 1';
        update account2;
        System.debug('>>>>Account 2'+account2);
        accountSet.add(account2);
        System.debug('...accountSet is'+accountSet+'  ,,,size is'+accountSet.size());
        System.debug('accounthere or not'+accountSet.contains(account2));
       //if one field also there are not unique 
        
    }
}