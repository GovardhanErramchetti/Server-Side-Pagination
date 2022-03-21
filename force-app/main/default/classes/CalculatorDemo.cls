public class CalculatorDemo {
	public Integer a;
    public Integer b;
    public Integer result;
    public CalculatorDemo()
    {
        a=0;
        b=0;
        result=0;
    }
    public void sum(Integer n1,Integer n2)
    {
        a=n1;
        b=n2;
        result=a + b;
        
    }
    public void multiply(Integer n1,Integer n2)
    {
        a=n1;
        b=n2;
        result=a * b;
    }
}