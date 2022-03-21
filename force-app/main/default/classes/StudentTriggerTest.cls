@isTest
public class StudentTriggerTest {
    static List<Student__c> studentList;
    static List<College__c> collegeList;
    public static void createData()
    {
        studentList=new List<Student__c>();
        collegeList=new List<College__c>();  List<College__c> collegeList=new List<College__c>();
        collegeList=TestDataFactory.createCollegeList('DemoCollege', 'Telangana', 5, false);
        for(College__c col : collegeList)
            col.Active_College__c=true;
        insert collegeList;
        //creating 10 student per each college
        List<Student__c> studentList=new List<Student__c>();
        for(College__c col : collegeList)
        {
            studentList.addAll(TestDataFactory.createStudentList('testStudent'+col.Name, col.State__c,'Hyderabad', col.Id, 10, false));
            
        }
        insert studentList;
    }
    @isTest
    public static void testStudentCount()
    {
        /*llege__c college1=new College__c();
college1.Active_College__c=true;
college1.State__c='Telangana';
college1.Name='test college 1';
insert college1;
Student__c student1=new Student__c();
student1.Name='test1';
student1.City__c='Hydera/bad';
student1.State__c='Telangana';
student1.College_Name__c=college1.id;
student1.Student_Email__c=student1.Name+'@gmail.com';
//college1.Student_Count__c;
insert student1;
College__c tempCollege=new College__c();

for(College__c col:[SELECT Id,Student_Count__c
FROM College__c
WHERE Id=:college1.id])
{
tempCollege=col;
}
System.assertEquals(1, tempCollege.Student_Count__c);



//creating 5 colleges
List<College__c> collegeList=new List<College__c>();
collegeList=TestDataFactory.createCollegeList('DemoCollege', 'Telangana', 5, false);
for(College__c col : collegeList)
col.Active_College__c=true;
insert collegeList;
//creating 10 student per each college
List<Student__c> studentList=new List<Student__c>();
for(College__c col : collegeList)
{
studentList.addAll(TestDataFactory.createStudentList('testStudent'+col.Name, col.State__c,'Hyderabad', col.Id, 5, false));

}
insert studentList;
*/
        createData();
        
        for(College__c college :[SELECT Id,Student_Count__c
                                 FROM College__c
                                 WHERE Id IN :collegeList])
        {
            System.assertEquals(10, college.Student_Count__c);
        }
        
        
    }
    @isTest
    public static void testStudentCountOnDelete()
    {
        createData();
        
        List<Student__c> deleteList=new List<Student__c>();
        for(Student__c stu : studentList)
        {
            if(stu.College_Name__c ==collegeList.get(0).Id )
            {
                deleteList.add(stu);
            }
        }
        delete deleteList;
        
        College__c tempCollege=new College__c();
        for(College__c col : [SELECT Id,Name,Student_Count__c
                              FROM College__c 
                              WHERE Id =:collegeList.get(0).Id])
        {
            tempCollege=col;
        }
        System.assertEquals(0 , tempCollege.Student_Count__c);
    }
    @isTest
    public static void testStudentCountOnUnDelete()
    {
        createData();
        List<Student__c> deleteList=new List<Student__c>();
        for(Student__c stu : studentList)
        {
            if(stu.College_Name__c ==collegeList.get(0).Id )
            {
                deleteList.add(stu);
            }
        }
        Test.startTest();
        delete deleteList;
        Test.stopTest();
        
        List<Student__c> unDeleteList=new List<Student__c>();
        unDeleteList=[SELECT Id
                      FROM Student__c
                      WHERE isDeleted= true
                      AND Id IN :deleteList
                      ALL ROWS];
        Test.startTest();
        
        undelete unDeleteList;
        Test.stopTest();
        
        
        College__c tempCollege=new College__c();
        for(College__c col : [SELECT Id,Name,Student_Count__c
                              FROM College__c 
                              WHERE Id =:collegeList.get(0).Id])
        {
            tempCollege=col;
        }
        System.assertEquals(10, tempCollege.Student_Count__c);
    }
    
}