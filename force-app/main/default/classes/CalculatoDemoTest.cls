@isTest
public class CalculatoDemoTest {
	@isTest
    static void testSum()
    {
        CalculatorDemo obj=new CalculatorDemo();
        obj.sum(10, 15);
        System.assertEquals(25, obj.result);
    }
    static testMethod void multiply()
    {
         CalculatorDemo obj=new CalculatorDemo();
        obj.multiply(10, 15);
        System.assertEquals(150, obj.result);
    }
    
}