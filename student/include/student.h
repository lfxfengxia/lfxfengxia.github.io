#ifndef QY_STUDENT_H
#define QY_STUDENT_H

#define BUFSIZE      32
#define STUNUM       100
#define NAMESIZE     32
#define MINAGE       4
#define MAXAGE       100
#define MINSTUDYID   20140001
#define MAXSTUDYID   20149999

enum command {
    kListStudents,
    kAddStudent,
    kDelStudent,
    kSearchStudent,
    kQuit,
};

typedef struct students{
    char name[NAMESIZE];
    int studyID;
    int age;
    int flag;
}STU;

extern STU *allocStudentsRecords(int);
extern void printStudents(STU *);
extern int addStudent(STU *,char *,int,int);
extern int delStudent(STU *,int);
extern int searchStudent(STU *,int);
extern void deallocStudentsRecords(STU *);

#endif
