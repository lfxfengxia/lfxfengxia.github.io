#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<errno.h>
#include"../include/student.h"

//打印主界面图样
void printPic(void)
{
    fprintf(stderr,"===================================================================================\n");
    fprintf(stderr,"=================\n");
    putchar('\n');
    fprintf(stderr,"                             *********************\n");
    putchar('\n');
    fprintf(stderr,"            WELLCOM TO INPUT STUDEHNTS INFORMATION MANAGMENT SYSTEM \n");
    putchar('\n');
    fprintf(stderr,"Please input a number to hance operation that you want to(the detail as follow):\n ");
    fprintf(stderr,"List  students information ---------- 0\n");
    fprintf(stderr,"Insert students information ---------- 1\n");
    fprintf(stderr,"Delete students information ---------- 2\n");
    fprintf(stderr,"Modify students information ---------- 3\n");
    fprintf(stderr,"Search students information ---------- 4\n");
    fprintf(stderr,"Quit  the  system -------------------- 5\n");
    fprintf(stderr, "                                                                    xxx  liufengxia \n");
    fprintf(stderr, "                                                                    xxx  2014-09-30 \n");
    fprintf(stderr,"                                                                 ==================\n");
    fprintf(stderr,"===================================================================================\n");
    putchar('\n');
}
//将用户输入的信息转换为long类型，并返回转换结果，如果转换失败测返回－1
static long getInput()
{
    char buf[BUFSIZE] = {0};
    long result = -1;

    fgets(buf,BUFSIZE,stdin);
    result = strtol(buf,NULL,0);
    if((result == 0 && errno == EINVAL) || (errno == ERANGE)){
        return -1;
        errno = 0;
    }
    return result;
}

//接收用户输入的学号，并判断是否有效
static int getStudyID(void)
{
    int studyID = -1;
_INPUTSTUDYID:
    printf("Please input student's atudy ID:\n");
    studyID = (int)getInput();
    if(studyID < MINSTUDYID || studyID > MAXSTUDYID){
        fprintf(stderr,"Invalid Input (Study ID must in [20140001,2014999])!\n");
        goto _INPUTSTUDYID;
    }
    return studyID;
}


int main(void)
{
    int cmd = -1;
    char name[NAMESIZE] = {0};
    int studyID = -1;
    int age = -1;
    STU *stu = NULL;

    //为学生信息分配内存并初始化
    stu = allocStudentsRecords(STUNUM);
    if(NULL == stu)
    {
        goto _FAIL;
    }
    while (1) {
        printPic();
        // 1. 提示用户输入命令
        printf("Please input command number:\n");
        // 2. 接收用户输入的命令(怀疑用户的输入,也就是对用户输入进行检查)
        cmd = getInput();
        fpurge(stdin);
        if(cmd == -1 || cmd < kListStudents || cmd > kQuit){
            fprintf(stderr,"Invalid Input !\n");
            continue;
        }
        // 3. 匹配用户输入的命令，执行相应的操作
        switch (cmd) {
            case kListStudents:
                printStudents(stu);
                break;
            case kAddStudent:
                //提示用户输入学生信息－姓名
                printf("Please input student's name:\n");
                fgets(name,NAMESIZE,stdin);
                name[strlen(name) - 1] = '\0';
                //提示用户输入学生信息－年龄
_INPUTAGE:
                printf("Please input student's age:\n");
                age = (int)getInput();
                if(age < MINAGE || age > MAXAGE){
                    fprintf(stderr,"Invalid Input !(Age must in [4,100])\n");
                    goto _INPUTAGE;
                }
                //提示用户输入学生信息－学号
                studyID = getStudyID();
                addStudent(stu,name,age,studyID);
                break;
            case kDelStudent:
                studyID = getStudyID();
                delStudent(stu,studyID);
                break;
            case kSearchStudent:
                studyID = getStudyID();
                searchStudent(stu,studyID);
                break;
            case kQuit:
                printf("You have successfully out of the sysytem 1\n");
                goto _EXIT;
                break;
            default:
                fprintf(stdout, "Not go to here !\n");
                break;
        }

    }
_FAIL:
    exit(1);
_EXIT:
    deallocStudentsRecords(stu);
    return 0;
}
