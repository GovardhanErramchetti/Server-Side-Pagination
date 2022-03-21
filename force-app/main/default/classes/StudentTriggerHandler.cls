public without sharing class StudentTriggerHandler {
    
    public static void countStudents(List<Student__c> newList,List<Student__c> oldList,Map<Id,Student__c> oldMap)
    {
        Set<Id> collegeIdSet=new Set<Id>();
        Map<Id,Integer> collegeIdtoStudentCountMap= new Map<Id,Integer>();
        if(newList != NULL){
            for(Student__c student:newList)
            {
                if(oldMap==NULL || student.College_Name__c != oldMap.get(student.Id).College_Name__c)
                {   
                    if(student.College_Name__c	!=null)
                    {
                        collegeIdSet.add(student.College_Name__c);
                        collegeIdtoStudentCountMap.put(student.College_Name__c,0);
                        
                    }
                    if(oldMap !=NULL && oldMap.get(student.Id).College_Name__c != NULL)
                    {
                        collegeIdSet.add(oldMap.get(student.Id).College_Name__c);
                        collegeIdtoStudentCountMap.put(oldMap.get(student.Id).College_Name__c,0);
                    }
                }
            }
        }
        else
        {
            for(Student__c student : oldList)
            {
                collegeIdSet.add(oldMap.get(student.Id).College_Name__c);
                collegeIdtoStudentCountMap.put(oldMap.get(student.Id).College_Name__c,0);
            }
        }
        for(Student__c student:[SELECT Id,Name,College_Name__c
                                FROM Student__c
                                WHERE  College_Name__c IN:collegeIdSet])
        {
            
            Integer count=collegeIdtoStudentCountMap.get(student.College_Name__c);
            count=count+1;
            collegeIdtoStudentCountMap.put(student.College_Name__c,count);
        }
        List<College__c> collegeUpdateList = new List<College__c>();
        for(Id collegeId:collegeIdtoStudentCountMap.keySet())
        {
            College__c college= new College__c();
            college.id=collegeId;
            college.Student_Count__c=collegeIdtoStudentCountMap.get(collegeId);
            collegeUpdateList.add(college);
        }
        if(collegeUpdateList.size()>0)
        {
            update collegeUpdateList;
        }
    }
    //inner query usage
    public static void countStudents2(List<Student__c> newList,List<Student__c> oldList,Map<Id,Student__c> oldMap)
    {
        Set<Id> collegeIdSet=new Set<Id>();
        Map<Id,Integer> collegeIdtoStudentCountMap= new Map<Id,Integer>();
        if(newList != NULL){
            for(Student__c student:newList)
            {
                if(oldMap==NULL || student.College_Name__c != oldMap.get(student.Id).College_Name__c)
                {   
                    if(student.College_Name__c	!=null)
                    {
                        collegeIdSet.add(student.College_Name__c);
                        collegeIdtoStudentCountMap.put(student.College_Name__c,0);
                        
                    }
                    if(oldMap !=NULL && oldMap.get(student.Id).College_Name__c != NULL)
                    {
                        collegeIdSet.add(oldMap.get(student.Id).College_Name__c);
                        collegeIdtoStudentCountMap.put(oldMap.get(student.Id).College_Name__c,0);
                    }
                }
            }
        }
        else
        {
            for(Student__c student : oldList)
            {
                collegeIdSet.add(oldMap.get(student.Id).College_Name__c);
                collegeIdtoStudentCountMap.put(oldMap.get(student.Id).College_Name__c,0);
            }
        }
        for(College__c college : [SELECT Id,(SELECT Id FROM Students__r)
                                  FROM College__c
                                  WHERE Id IN:collegeIdSet])
        {
            collegeIdtoStudentCountMap.put(college.Id,college.Students__r.size());
         }
        List<College__c> collegeUpdateList = new List<College__c>();
        for(Id collegeId:collegeIdtoStudentCountMap.keySet())
        {
            College__c college= new College__c();
            college.id=collegeId;
            college.Student_Count__c=collegeIdtoStudentCountMap.get(collegeId);
            collegeUpdateList.add(college);
        }
        if(collegeUpdateList.size()>0)
        {
            update collegeUpdateList;
        }
    }
    
    //using aggregate query
  public static void countStudents3(List<Student__c> newList,List<Student__c> oldList,Map<Id,Student__c> oldMap)
    {
        Set<Id> collegeIdSet=new Set<Id>();
        Map<Id,Integer> collegeIdtoStudentCountMap= new Map<Id,Integer>();
        if(newList != NULL){
            for(Student__c student:newList)
            {
                if(oldMap==NULL || student.College_Name__c != oldMap.get(student.Id).College_Name__c)
                {   
                    if(student.College_Name__c	!=null)
                    {
                        collegeIdSet.add(student.College_Name__c);
                        collegeIdtoStudentCountMap.put(student.College_Name__c,0);
                        
                    }
                    if(oldMap !=NULL && oldMap.get(student.Id).College_Name__c != NULL)
                    {
                        collegeIdSet.add(oldMap.get(student.Id).College_Name__c);
                        collegeIdtoStudentCountMap.put(oldMap.get(student.Id).College_Name__c,0);
                    }
                }
            }
        }
        else
        {
            for(Student__c student : oldList)
            {
                collegeIdSet.add(oldMap.get(student.Id).College_Name__c);
                collegeIdtoStudentCountMap.put(oldMap.get(student.Id).College_Name__c,0);
            }
        }
        
        AggregateResult[] groupedResults=[SELECT College_Name__c ,COUNT(Id)
                                          FROM Student__c
                                          WHERE College_Name__c IN:collegeIdSet
                                          GROUP BY College_Name__c];
        for(AggregateResult ar : groupedResults)
        {
            collegeIdtoStudentCountMap.put(String.valueOf(ar.get('College_Name__c')),Integer.valueOf(ar.get('expr0')));
        }
        
        List<College__c> collegeUpdateList = new List<College__c>();
        for(Id collegeId:collegeIdtoStudentCountMap.keySet())
        {
            College__c college= new College__c();
            college.id=collegeId;
            college.Student_Count__c=collegeIdtoStudentCountMap.get(collegeId);
            collegeUpdateList.add(college);
        }
        if(collegeUpdateList.size()>0)
        {
            update collegeUpdateList;
        }
    }
}