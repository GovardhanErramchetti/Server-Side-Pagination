public class TestDataFactory {
    public static List<College__c> createCollegeList(String collegeName,String state,Integer count,Boolean isInsert)
    {
        List<College__c> collegeList=new List<College__c>();
        for(Integer i=1;i<=count ;i++)
        {
            College__c college = new College__c();
            college.Name=CollegeName+i;
            college.State__c = state;
            collegeList.add(college);
        }
        if(isInsert)
        {
            insert collegeList;
        }
        return collegeList;
    }
    public static List<Student__c> createStudentList(String  name,String state,String city,String collegeId,Integer count,Boolean isInsert)
    {
        List<Student__c> studentList =new List<Student__c>();
        for(Integer i=1; i<=count; i++)
        {
            Student__c student=new Student__c();
            student.Name=name+i;
            student.State__c=state;
            student.City__c=city;
            student.Student_Email__c=student.Name+'@gmail.com';
            if(collegeId !=null && collegeId !='')
            {
                student.College_Name__c=collegeId;
            }
            studentList.add(student);
            
        }
        if(isInsert)
        {
            insert studentList;
        }
        return studentList;
    }

}