# 1.查询同时存在1课程和2课程的情况
select * from (select * from student_course as sc where sc.courseId=1) as s1,(select * from student_course as su where su.courseId=2) as s2 where s1.studentId=s2.studentId;

# 2.查询同时存在1课程和2课程的情况
select * from (select * from student_course as sc where sc.courseId=1) as s1,(select * from student_course as su where su.courseId=2) as s2 where s1.studentId=s2.studentId;

# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
select sc.studentId,s.name,avg(sc.score) as avg_score from student_course as sc left join student as s on sc.studentid = s.id group by sc.studentId,s.name having avg(sc.score) >= 60;

# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
select s.id,s.name,s.age,s.sex from student as s where id not in (select studentId from student_course);

# 5.查询所有有成绩的SQL
select s.id,s.name,s.age,s.sex,sc.score from student_course as sc left join student as s on sc.studentid = s.id;

# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
select * from student where id in (select s1.studentId from student_course s1,student_course s2 where s1.studentId=s2.studentId and s1.courseId=1 and s2.courseId=2)；

# 7.检索1课程分数小于60，按分数降序排列的学生信息
select s.* from student_course sc,student s where sc.studentId = s.id and sc.score < 60 and sc.courseId = 1 order by sc.score; 

# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
select sc.courseId,avg(sc.score) from student_course sc group by sc.courseId order by avg(sc.score) desc,sc.courseId asc;

# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
select s.name,t.score from student s inner join (select sc.studentId as sid,sc.score from student_course sc,course c where sc.courseId = c.id and c.name="数学" and sc.score <60 ) as t on s.id = t.sid;



