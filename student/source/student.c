#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include "../include/student.h"

static int numOfStudents = 0;

STU * allocStudentsRecords(int number)
{
    STU *stu = NULL;
    int size = numOfStudents * sizeof(STU);
    stu = malloc(size);
    if(NULL == stu){
        perror("malloc");
        return NULL;
    }
    memset(stu,0,size);
    numOfStudents = number;
    return stu;
}

static void printStudent(STU *stu,int index)
{
    printf("============================================================\n");
    printf("name:%-20s,age:%-4dstudy Id:%-10d\n",stu[index].name,stu[index].age,stu[index].studyID);
}

void printStudents(STU *stu)
{
    printf("name\t\tage\tstudy ID\n");
    for(int i = 0;i < numOfStudents;i ++)
    {
        if(stu[i].flag == 1){
            printStudent(stu,i);
        }
    }
}

//检查学号是否已经存在, 冲突返回－1，
static int checkStudyID(STU *stu,int studyID)
{
    for(int i = 0;i < numOfStudents;i ++)
    {
        if(stu[i].studyID == studyID && stu[i].flag){
            return -1;
        }
    }
    return 0;
}

//搜索可以可用内存，并返回该索引号。
static int freePosition(STU *stu)
{
    for(int i = 0;i < numOfStudents;i ++)
    {
        if(stu[i].flag == 0){
            return i;
        }
    }
    return -1;
}

int addStudent(STU *stu,char *name,int age,int studyID)
{
    int index = -1;
    //查找学号是否冲突
    if(checkStudyID(stu,studyID) < 0){
            printf("The studyID < %d >has exsits: ",studyID);
            return -1;
    }

    //找到空闲位置索引
    index = freePosition(stu);
    if(index < 0){
        printf("There is any position to save student information!\n");
        return -1;
    }

    //对学生信息进行赋值
    strncpy(stu[index].name,name,NAMESIZE - 1);
    stu[index].age = age;
    stu[index].studyID = studyID;
    stu[index].flag = 1;

    printf("Add successfully!\n");
    return 0;
}


int delStudent(STU *stu,int studyID)
{
    for(int i = 0;i < numOfStudents;i ++)
    {
        if(stu[i].studyID == studyID &&stu[i].flag == 1){
            stu[i].flag = 0;
            printf("Delete successfully!\n");
            return 0;
        }
    }
    printf("The student is not sxists!\n");
    return -1;
}

int searchStudent(STU *stu,int studyID)
{
    for(int i = 0;i < numOfStudents;i ++)
    {
        if(stu[i].studyID == studyID && stu[i].flag == 1){
            printStudent(stu,i);
            return 0;
        }
    }
    printf("The student is not exists!\n");
    return -1;
}

void deallocStudentsRecords(STU *stu)
{
    free(stu);
}
