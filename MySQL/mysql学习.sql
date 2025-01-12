-- 注释
CREATE DATABASE mydatabase;-- 创建数据库
SHOW DATABASES;-- 查询数据库
-- 打开cmd编写sql语句
USE mydatabase;-- 使用数据库
ALTER DATABASE 数据库名称 CHARACTER 
SET 字符集名称;
DROP DATABASE mydatabase;-- 删除数据库
DROP DATABASE
IF
  EXISTS mydatabase;-- 加判断的创建
-- 使用数据库名称
USE mydatabase;
CREATE TABLE myuser ( -- 创建表结构
id INT, NAME VARCHAR ( 20 ), age INT, address VARCHAR ( 20 ), create_time DATE );
ALTER TABLE myuser RENAME TO myusers;-- 表重命名
DROP TABLE myusers;
INSERT INTO myuser ( age, `name`, TIME, address )
VALUES
  ( 19, 'Tc_traveler', '2024-07-24 10:10:15', '四川绵阳' );
UPDATE myuser 
SET `name` = 'Tc_traveler',
age = 19;
UPDATE myuser 
SET `name` = 'Fujiwarachika',
age = 17 
WHERE
  TIME = 20240723;
DELETE 
FROM
  myuser 
WHERE
  `name` = 'Tc_traveler';
DELETE 
FROM
  myuser;
TRUNCATE myuser;-- 不可回滚 删除整张表后再重新生成的
CREATE TABLE
IF
  NOT EXISTS employees ( id INT, NAME VARCHAR ( 20 ), sex TINYINT, salary DOUBLE );
INSERT INTO employees ( id, NAME, sex, salary )
VALUES
  ( 1, 'mayikt', 1, 3600 );
UPDATE employees 
SET salary = 8000 
WHERE
  id = 1;
UPDATE employees 
SET NAME = 'meite';
UPDATE employees 
SET salary = salary + 3000 
WHERE
  id = 1;
DELETE 
FROM
  employees 
WHERE
  id = 1;-- 约束 约束插入数据
CREATE TABLE student ( id INT PRIMARY KEY, NAME VARCHAR ( 40 ), age TINYINT );
CREATE TABLE myuser ( -- 联合主键
id INT, NAME VARCHAR ( 255 ), age INT, phone VARCHAR ( 13 ), PRIMARY KEY ( id, phone ) ) ;
DROP TABLE myuser;-- 删除表
INSERT INTO myuser VALUES(1001,'mayikt',22,'18009092159');
INSERT INTO myuser VALUES(1001,'mayikt',22,'18009092158');-- 联合主键是不能完全相同，有一部分不相同就可以插入
SELECT * FROM myuser;
CREATE TABLE `mayikt_users` (
  `id` int PRIMARY KEY AUTO_INCREMENT  ,
  `name` varchar(255),
  `age` int ,
  `phone` varchar(11) 
);
CREATE TABLE myuser(
id int PRIMARY KEY auto_increment,-- AUTO_INCREMENT自动递增 并且要与主键搭配
name varchar(255),
age int ,
phone varchar(11)
);
INSERT INTO myuser VALUES(NULL,'csna',22,'18009092159');
CREATE TABLE myuser(
id int PRIMARY KEY auto_increment,-- 并且要与主键搭配
name varchar(255),
age int ,
phone varchar(11)
)auto_increment=1000;-- 设置自动增长初始值
INSERT INTO myuser VALUES(NULL,'csna',22,'18009092159');
INSERT INTO myuser VALUES(NULL,'csna',22,'18009092159');
INSERT INTO myuser VALUES(NULL,'csna',22,'18009092159');
alter table myuser auto_increment 1000;
delete from myuser;-- delete 删除数据之后，自动增长还是从最后一个删除数据的id基础上做自增;
TRUNCATE myuser;-- truncate 清空数据之后 自动增长是从初始值1开始
-- truncate:会清空表中所有的数据，速度快，不可回滚；实质是删除整张表包括数据再重新创建表；自动设定初始值 失效;delete:逐行删除数据，每步删除都是有日志记录的，可以回滚数据；实质是逐行删除表中的数据；
CREATE TABLE myuser (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  age int NOT NULL,
  phone varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
);
ALTER TABLE mydatabase.myuser MODIFY name VARCHAR(255) not NULL;
CREATE TABLE myuser (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(255),
  age int DEFAULT NULL,
  phone varchar(11) ,
  PRIMARY KEY (id),
  UNIQUE KEY unique_phone (phone)  -- 指定约束名称和约束字段
);
CREATE TABLE myuser (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT 'mayikt',-- 默认约束
  `age` int DEFAULT 1,
  `phone` varchar(11) ,
  PRIMARY KEY (`id`)
);-- 在修改表时添加默认值约束
-- ALTER TABLE <数据表名>
-- CHANGE COLUMN <字段名> <数据类型> DEFAULT <默认值>;
CREATE TABLE myuser(
id int(10) ZEROFILL
);
INSERT INTO myuser VALUES(1);
-- dql 数据库查询语言
-- 创建数据库 ddl
create DATABASE if not EXISTS   mayikt;
-- 使用mayikt数据库
use mayikt;
-- 创建mayikt_student学生表
CREATE TABLE `mayikt_student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) not null COMMENT '姓名',
  `age` tinyint  COMMENT '年龄',
  `address` varchar(255) COMMENT '地址',
  `class_id` int  COMMENT '班级id',
  PRIMARY KEY (`id`)
);
-- 新增测试数据 dml
INSERT INTO mayikt_student VALUES(NULL,'小余',28,'湖北武汉','01');
INSERT INTO mayikt_student VALUES(NULL,'小哈',21,'上海','01');
INSERT INTO mayikt_student VALUES(NULL,'张三',17,'北京','02');
INSERT INTO mayikt_student VALUES(NULL,'李四',22,'山东','02');
INSERT INTO mayikt_student VALUES(NULL,'王麻子',11,'四川','02');
SELECT * FROM mayikt_student;
-- 1.查询所有的学生
select * from mayikt_student;
-- 2.查询学生的姓名和年龄
select name,age from mayikt_student;
-- 3.别名称查询 使用关键字as 
select s.`name`,s.address from mayikt_student as s;
-- 4.列别名称
select name as 姓名,age as 年龄  from mayikt_student;
-- 5.去重复值
select DISTINCT class_id from mayikt_student;
-- 6.查询结果是表达式(运算值)；将所有的学生年龄+5岁
select name,age+5 as age  from mayikt_student;
select name,age+5 from mayikt_student;-- 没有as age会导致查询出来的表变成age+5
-- 查询学生的名称是为小余
SELECT * FROM mayikt_student WHERE `name`='小余';
-- 查询学生的名称不是为小余
SELECT * FROM mayikt_student WHERE `name`!='小余';
-- 查询学生年龄是为17岁
SELECT * FROM mayikt_student WHERE age=17;
-- 查询学生年龄是大于17岁
SELECT * FROM mayikt_student WHERE age>17;
-- 查询学生年龄是小于17岁
SELECT * FROM mayikt_student WHERE age<17;
-- 查询学生年龄是18岁-40岁之间
SELECT * FROM mayikt_student WHERE age>17&&age<=40;
-- 查询年龄是在17或者 28岁的学生
SELECT * FROM mayikt_student WHERE age=17||age=28;
-- 查询名称含有“军”
SELECT * FROM mayikt_student WHERE `name` like '%军%';
-- 查询名称开头“小”
SELECT * FROM mayikt_student WHERE `name` like '小%';
-- 查询名称第二字“汉”
SELECT * FROM mayikt_student WHERE `name` like '_汉%';
-- 查询地址是为null学生
SELECT * from mayikt_student where address is null;
-- 查询地址不是为null的学生
SELECT * from mayikt_student where address is not null;
-- 1.根据学生年龄从小到大;
SELECT * FROM mayikt_student ORDER BY age ASC;
-- 2.根据学生年龄从大到小;
SELECT * FROM mayikt_student ORDER BY age DESC;
-- 3.判断学生的年龄大于18岁，在从小到大排序
SELECT * FROM mayikt_student WHERE age>18 ORDER BY age;
-- 4.根据学生的年龄从大到小排序，以班级id 从小到大排序  当年龄相同 则根据 班级id从小到大排序
SELECT * FROM mayikt_student ORDER BY age DESC,class_id ASC;-- 谁在前面谁就是主要的
-- 5.根据班级id去重，根据班级id从大到小排序
SELECT DISTINCT class_id FROM mayikt_student ORDER BY class_id DESC;
-- 一般的情况下我们使用数字排序，从小到大 或者从大到小；
-- 如果是字母排序 则 根据字母的顺序 从A到Z排序 或者Z到A顺序
-- 如果是汉字的拼音排序，用的比较多是在人名的排序中，按照姓氏的拼音字母，从A到Z排序
SELECT * FROM mayikt_student ORDER BY `name` DESC;
SELECT * FROM mayikt_student ORDER BY name ASC;
SELECT * FROM mayikt_student ORDER BY id desc;
CREATE TABLE csndm(
`name` VARCHAR(255) not NULL
);
INSERT into csndm VALUES('114514');
INSERT into csndm VALUES('13');
INSERT into csndm VALUES('mb');
INSERT into csndm VALUES('Tc_traveler');
INSERT into csndm VALUES('1919');
INSERT into csndm VALUES('1111');
INSERT into csndm VALUES('1234');
INSERT into csndm VALUES('gtnh');
SELECT * FROM csndm ORDER BY `name` ASC;
-- 分页
SELECT * FROM mayikt_student LIMIT 2;-- 查询前两条数据
SELECT * FROM mayikt_student LIMIT 2,2;-- 排除前2个 从第三个开始查询两个数据 SELECT * FROM mayikt_student LIMIT m,n;
-- 聚合查询
-- 1.查询学生表的总人数
SELECT COUNT(*) as 人数 FROM mayikt_student; 
-- 2.查询学生年龄大于18的 总人数
SELECT COUNT(*) as 大于十八岁的人数 from mayikt_student WHERE age>18;
-- 3.查询classid=1 所有学生年龄总和
SELECT SUM(age) as 一班所有学生年龄总和 FROM mayikt_student WHERE class_id=1;
-- 4.查询学生最大年龄
SELECT MAX(age) as 最大年龄 FROM mayikt_student;
-- 5.查询学生最小年龄
SELECT MIN(age) as 最小年龄 FROM mayikt_student;
-- 6.求学生年龄的平均值
SELECT AVG(age) as 最小年龄 FROM mayikt_student;-- 在求平均值的时候也会忽略掉null 之前多少加入null后依然是多少
INSERT INTO mayikt_student VALUES(NULL,'12',NULL,NULL,NULL);
-- 分组查询
SELECT COUNT(*) FROM mayikt_student WHERE class_id=1;
SELECT COUNT(*) FROM mayikt_student WHERE class_id=2;
SELECT class_id as 班级,COUNT(*) as 人数 FROM mayikt_student GROUP BY class_id;
SELECT address as 地址,count(*) as 人数 FROM mayikt_student GROUP BY address;
-- 1、where 后不能跟聚合函数，因为where执行顺序大于聚合函数。
-- 2、where 子句的作用是在对查询结果进行分组前，将不符合where条件的行去掉，即在分组之前过滤数据，条件中不能包含聚组函数，使用where条件显示特定的行。
-- 3、having 子句的作用是筛选满足条件的组，即在分组之后过滤数据，条件中经常包含聚组函数，使用having 条件显示特定的组，也可以使用多个分组标准进行分组。
-- 统计每个班级学生人数大于1人以上的班级
SELECT class_id as 班级, count(*) as 人数 from mayikt_student GROUP BY class_id HAVING count(*) >1
-- from->group by->count->having->order by
-- 练习一
CREATE TABLE `meite_student` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sex` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `chinese` int DEFAULT NULL,
  `english` int DEFAULT NULL,
  `maths` int DEFAULT NULL
) ;
-- 测试数据
INSERT INTO `mayikt`.`meite_student`(`id`, `name`, `sex`, `chinese`, `english`, `maths`) VALUES ('1', '小余', '男', '98', '99', '100');
INSERT INTO `mayikt`.`meite_student`(`id`, `name`, `sex`, `chinese`, `english`, `maths`) VALUES ('2', '刘文', '女', '99', '87', '88');
INSERT INTO `mayikt`.`meite_student`(`id`, `name`, `sex`, `chinese`, `english`, `maths`) VALUES ('3', '王麻子', '女', '22', '55', '33');
INSERT INTO `mayikt`.`meite_student`(`id`, `name`, `sex`, `chinese`, `english`, `maths`) VALUES ('4', '黄红军', '男', '55', '33', '22');
INSERT INTO `mayikt`.`meite_student`(`id`, `name`, `sex`, `chinese`, `english`, `maths`) VALUES ('5', '张玲', '女', '95', '95', '88');
-- 1.查询表中所有学生信息
SELECT * FROM meite_student;
-- 2.查询表中所有学生信息 只返回学生名称和数学成绩 字段
SELECT name,maths FROM meite_student;
-- 3.过滤表中重复数据
SELECT DISTINCT * from meite_student;
-- 4.统计每个学生的总分
SELECT id,`name`,sex,chinese+english+maths as 总分 FROM meite_student;
-- 5.所有学生总分 加5分
SELECT id,`name`,sex,chinese+english+maths+5 as '总分+5' FROM meite_student;
-- 6.查询语文成绩大于80分以上同学
SELECT name FROM meite_student WHERE chinese>80;
-- 7.查询总分大于180分以上同学
SELECT `name` FROM meite_student WHERE chinese+english+maths>180;
-- 8.查询英语成绩80-90 之间的同学
SELECT `name` FROM meite_student WHERE english<=90&&english>=80;
-- 9.查询英语成绩不在80-90 之间的同学
SELECT `name` FROM meite_student WHERE english>90||english<80;
-- 10.查询英语成绩22,99,33学生 信息
SELECT * FROM meite_student WHERE english=22||english=99||english=33;
-- 11.查询所有姓余的学生信息 like
SELECT * FROM meite_student WHERE `name` LIKE '余%';
-- 12.查询语文、数学、外语 大于等于72分的学生信息
SELECT * FROM meite_student WHERE chinese>=72 and english>=72 and maths>=72;
-- 13.查询英语大于等于72分或者总分大于等于180分以上学生信息 or
SELECT * FROM meite_student WHERE english>=72 or chinese+english+maths>=180;
-- 14.根据英语成绩字段排序 升序和降序
SELECT * FROM meite_student ORDER BY english ASC;
SELECT * FROM meite_student ORDER BY english DESC;
-- 15.根据总分成绩 从高到低排列
SELECT * FROM meite_student ORDER BY chinese+english+maths DESC;
-- 16.统计学生表中 性别男和女 分别有多少学生
SELECT sex,COUNT(*) as 人数 FROM meite_student GROUP BY sex;
-- 17.根据英语成绩字段排序 (从高到低排序 取前3名)
SELECT * FROM meite_student ORDER BY english DESC LIMIT 3;
-- 练习二
CREATE TABLE `employee` (
  `number` int DEFAULT NULL COMMENT '员工编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '姓名',
  `hiredate` date DEFAULT NULL COMMENT '入职时间',
  `salary` double DEFAULT NULL COMMENT '薪资',
  `bonus` double DEFAULT NULL COMMENT '奖金',
  `department` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门编号'
)
INSERT INTO `mayikt`.`employee` VALUES ('1001', '小余', '2020-06-01', '18000', '3000', '研发部门');
INSERT INTO `mayikt`.`employee` VALUES ('1002', '刘军', '2019-06-01', '16000', '1000', '研发部门');
INSERT INTO `mayikt`.`employee` VALUES ('1003', '张三', '2018-02-10', '6000', '500', '财务部门');
INSERT INTO `mayikt`.`employee` VALUES ('1004', '王麻子', '2022-02-10', '27000', '500', '财务部门');
INSERT INTO `mayikt`.`employee` VALUES ('1005', '刘软', '2013-02-10', '6000', '500', 'UI部门');
INSERT INTO `mayikt`.`employee` VALUES ('1006', '王麻子', '2022-02-10', '6000', '500', 'UI部门');
INSERT INTO `mayikt`.`employee` VALUES ('1007', '李四', '2022-02-25', '5000', '100', '财务部门');
INSERT INTO `mayikt`.`employee` VALUES ('1008', '余国军', '2022-02-25', '10000', '50', '研发部门');
-- 1. 根据员工的薪资升序或者降序排列
SELECT * FROM employee ORDER BY salary ASC;
SELECT * from  employee ORDER BY salary DESC;
-- 2.根据员工的薪资升序排列，且不查询到财务部门的员工信息
SELECT * FROM employee WHERE department!='财务部门' ORDER BY salary ASC;
-- 3.查询姓名第二字非“麻”的且薪资>=15000的员工信息，根据薪资升序排列
SELECT * FROM employee WHERE `name` NOT LIKE '_麻%' and salary>=15000 ORDER BY salary ASC;
-- 4.查询每位员工综合年薪 根据年薪降序排列
SELECT * FROM employee ORDER BY salary*12+bonus DESC;
-- 5.求每个不同部门的平均薪水
SELECT AVG(salary) as 平均薪水,department FROM employee GROUP BY department;
-- 6.求每个不同部门的平均薪水且平均薪资大于13000的部门
SELECT AVG(salary),department FROM employee GROUP BY department HAVING AVG(salary)>13000;
-- 7.求每个部门中最高薪水
SELECT MAX(salary),department FROM employee GROUP BY department;
-- 8.求每个部门有多少员工
SELECT COUNT(*),department FROM employee GROUP BY department;
-- 9.查询员工最高薪资和最低薪资员工信息
SELECT * FROM employee ORDER BY salary ASC LIMIT 1;
SELECT * FROM employee ORDER BY salary DESC LIMIT 1;
-- 10.查询员工最高薪资和最低薪资的差距
SELECT MAX(salary)-MIN(salary) FROM employee;
-- 多表查询
-- 外键
CREATE TABLE `mayikt_class` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `mayikt_student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `age` tinyint DEFAULT '0',
  `address` varchar(255) DEFAULT NULL,
  `class_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT mayikt_class_id  FOREIGN KEY (class_id)  REFERENCES  mayikt_class(id) -- 外键约束
); 
-- 删除外键约束
-- ALTER TABLE <表名> DROP FOREIGN KEY <外键约束名>;
-- ALTER TABLE mayikt_student DROP FOREIGN KEY mayikt_class_id;
-- 联表查询
CREATE TABLE `mayikt_class` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `mayikt_student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `age` tinyint DEFAULT '0',
  `address` varchar(255) DEFAULT NULL,
  `class_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT mayikt_class_id  FOREIGN KEY (class_id)  REFERENCES  mayikt_class(id) -- 外键约束
); 
INSERT INTO `mayikt`.`mayikt_class` (`id`, `name`) VALUES ('1', '第一期');
INSERT INTO `mayikt`.`mayikt_class` (`id`, `name`) VALUES ('2', '第二期');
INSERT INTO `mayikt`.`mayikt_student` (`id`, `name`, `age`, `address`, `class_id`) VALUES ('1', 'mayikt', '18', '武汉市', '1');
INSERT INTO `mayikt`.`mayikt_student` (`id`, `name`, `age`, `address`, `class_id`) VALUES ('2', 'meite', '23', '上海市', '2');
INSERT INTO `mayikt`.`mayikt_student` (`id`, `name`, `age`, `address`, `class_id`) VALUES ('3', '李思', '12', '孝感市', '1');
INSERT INTO `mayikt`.`mayikt_student` (`id`, `name`, `age`, `address`, `class_id`) VALUES ('4', '刘流', '27', '武汉市', '1');
-- 笛卡尔积 交叉连接
select  * from mayikt_class,mayikt_student;
-- 内连接
-- 1.查询每个班级下所有学生信息
-- 显式内连接
SELECT * FROM mayikt_class INNER JOIN mayikt_student ON mayikt_class.id =mayikt_student.class_id;-- inner可以不写
-- 隐式内连接
select  * from mayikt_class,mayikt_student WHERE mayikt_class.id = mayikt_student.class_id;
-- 2.查询第一期所有学生
SELECT * FROM mayikt_class,mayikt_student WHERE mayikt_class.id=mayikt_student.class_id and mayikt_class.id=1;
select * from mayikt_class  INNER JOIN  mayikt_student on mayikt_class.id =mayikt_student.class_id and mayikt_class.id=1;
-- 3.查询第一期和第二期所有的学生
select * from mayikt_class  INNER JOIN  mayikt_student on mayikt_class.id =mayikt_student.class_id and (mayikt_class.id='1' or  mayikt_class.id='2');-- 注意这个括号
select * from mayikt_class  INNER JOIN  mayikt_student on mayikt_class.id =mayikt_student.class_id and mayikt_student.class_id  in (1,2);
-- 4.查询每个班级下的学生总数 并且学生总数升序排列
SELECT mayikt_class.`name`,count(*) from mayikt_class INNER JOIN mayikt_student on mayikt_class.id=mayikt_student.class_id GROUP BY mayikt_class.id ORDER BY COUNT(*) ASC;
-- 5.查询班级总人数>2的班级，并且人数降序排列
SELECT mayikt_class.`name`,count(*) FROM mayikt_class INNER JOIN mayikt_student on mayikt_class.id=mayikt_student.class_id GROUP BY mayikt_class.id HAVING COUNT(*) >2 ORDER BY COUNT(*) DESC;
-- 外连接
-- 左连接：以左边为准
-- 右连接：以右边为准
-- 内连接：左右都要同时匹配才会返回
-- 1.查询哪些班级是有学生 哪些班级是没有学生
SELECT * FROM mayikt_class LEFT JOIN mayikt_student on mayikt_class.id=mayikt_student.class_id;
-- 2.查询哪些学生是有班级，哪些学生是没有班级
SELECT * FROM mayikt_class RIGHT JOIN mayikt_student on mayikt_class.id=mayikt_student.class_id and mayikt_class.id not is NULL;
-- 3.使用union关键字实现左连接和右连接的并集 让去重复数据
SELECT * FROM mayikt_class LEFT JOIN mayikt_student on mayikt_class.id=mayikt_student.class_id UNION SELECT * FROM mayikt_class RIGHT JOIN mayikt_student on mayikt_class.id=mayikt_student.class_id and mayikt_class.id;-- 左右连接的交集
-- 子查询
-- 1.查询年龄最大的学生信息，显示信息包含 学生的id、学生的名称、学生的年龄
SELECT * FROM mayikt_student WHERE age in (SELECT MAX(age) FROM mayikt_student);
-- 2.查询第一期和第三期学生信息
-- 方式1 关联查询
SELECT * FROM mayikt_student JOIN mayikt_class ON mayikt_student.class_id=mayikt_class.id and (mayikt_class.id=1 or mayikt_class.id=3);
-- 方式2 子查询
SELECT * FROM mayikt_student WHERE class_id in (SELECT id from mayikt_class WHERE `name`='第一期' or `name`='第三期');
-- 3.查询第一期学生年龄大于18岁的学生信息
-- 关联查询1
SELECT * FROM mayikt_student INNER JOIN mayikt_class on mayikt_student.class_id=mayikt_class.id and mayikt_class.id=1 and mayikt_student.age>18;
-- 子查询
select * from mayikt_student where age >18 and class_id in (select id from mayikt_class where id='1')
-- 关联查询2
select * from (select * from mayikt_class where id='1') a1 join (select * from mayikt_student where age >18) a2 on a1.id=a2.class_id;
-- 关键字all
-- 查询年龄大于第一期所有年龄的学生信息
SELECT * FROM mayikt_student WHERE age > all(SELECT age from mayikt_student WHERE class_id=1);
-- 查询没有班级的学生信息
SELECT * from mayikt_student WHERE class_id!= all(SELECT id FROM mayikt_class);-- 不能判断null
-- exists关键字
-- 1.查询学生年龄大于18岁 学生信息
SELECT * from mayikt_student WHERE EXISTS(SELECT * FROM mayikt_student WHERE age>18);-- 这会返回所有结果
SELECT * from mayikt_student s1 WHERE EXISTS(SELECT * FROM mayikt_student s2 WHERE s1.age>18);-- 这个好
-- 2.查询班级下有学生的班级
select * from mayikt_class a where  EXISTS(select * from mayikt_student  b where b.class_id=a.id);
select * from mayikt_student
-- 3.查询所有有班级的学生
s1 where EXISTS(select * from mayikt_class b where s1.class_id = b.id);
-- 自查询
CREATE TABLE `commodity_type` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品类型名称',
  `parent_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
SELECT * from commodity_type as a,commodity_type as b WHERE a.id = b.parent_id;
-- 多表查询练习
-- 练习1
CREATE TABLE `mayikt_dept` (
  `dept_no` int NOT NULL COMMENT '部门id',
  `dept_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门名称',
  `dept_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门地址',
  PRIMARY KEY (`dept_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
CREATE TABLE `mayikt_emp` (
  `emp_number` int DEFAULT NULL COMMENT '员工编号',
  `emp_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '员工编号',
  `emp_post` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '员工职务',
  `emp_leader_number` int DEFAULT NULL COMMENT '员工领导编号',
  `emp_hiredate` datetime DEFAULT NULL COMMENT '员工入职时间',
  `emp_salary` double(10,0) DEFAULT NULL COMMENT '员工薪水',
  `emp_bonus` int DEFAULT NULL COMMENT '员工奖金',
  `emp_deptno` int DEFAULT NULL COMMENT '员工对外部门表外键'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
INSERT INTO `mayikt`.`mayikt_dept` (`dept_no`, `dept_name`, `dept_address`) VALUES ('1', '技术部门', '湖北武汉市');
INSERT INTO `mayikt`.`mayikt_dept` (`dept_no`, `dept_name`, `dept_address`) VALUES ('2', '财务部门', '中国上海市');
INSERT INTO `mayikt`.`mayikt_dept` (`dept_no`, `dept_name`, `dept_address`) VALUES ('3', '设计部门', '湖北孝感市');
INSERT INTO `mayikt`.`mayikt_emp` (`emp_number`, `emp_name`, `emp_post`, `emp_leader_number`, `emp_hiredate`, `emp_salary`, `emp_bonus`, `emp_deptno`) VALUES ('1001', '小余', 'CEO', NULL, '2021-11-01 11:32:46', '20000', '10000', '1');
INSERT INTO `mayikt`.`mayikt_emp` (`emp_number`, `emp_name`, `emp_post`, `emp_leader_number`, `emp_hiredate`, `emp_salary`, `emp_bonus`, `emp_deptno`) VALUES ('1002', '小薇', 'CFO', '1001', '2021-10-01 11:32:46', '5000', '10000', '2');
INSERT INTO `mayikt`.`mayikt_emp` (`emp_number`, `emp_name`, `emp_post`, `emp_leader_number`, `emp_hiredate`, `emp_salary`, `emp_bonus`, `emp_deptno`) VALUES ('1004', '张三', 'CTO', NULL, '2021-11-01 11:32:46', '80000', '10000', '1');
INSERT INTO `mayikt`.`mayikt_emp` (`emp_number`, `emp_name`, `emp_post`, `emp_leader_number`, `emp_hiredate`, `emp_salary`, `emp_bonus`, `emp_deptno`) VALUES ('1005', '李四', '技术总监', '1004', '2021-11-01 11:32:46', '20000', '10000', '1');
INSERT INTO `mayikt`.`mayikt_emp` (`emp_number`, `emp_name`, `emp_post`, `emp_leader_number`, `emp_hiredate`, `emp_salary`, `emp_bonus`, `emp_deptno`) VALUES ('1006', '王麻子', '客服', NULL, '2022-03-02 11:49:45', '3500', NULL, NULL);
-- 1.返回员工拥有部门的 员工信息含员工部门
SELECT * from mayikt_emp as a INNER JOIN mayikt_dept as b on a.emp_deptno = b.dept_no;
-- 2.查询员工薪资大于小薇的 员工信息
SELECT * FROM mayikt_emp WHERE emp_salary >(SELECT emp_salary FROM mayikt_emp WHERE emp_name='小薇');
-- 3.返回员工所属领导信息
SELECT * from mayikt_emp as em INNER JOIN mayikt_emp as le WHERE em.emp_leader_number=le.emp_number;
-- 4.返回入职时间早于领导 入职时间
SELECT * from mayikt_emp as em INNER JOIN mayikt_emp as le WHERE em.emp_leader_number=le.emp_number and em.emp_hiredate<le.emp_hiredate;
-- 5.返回从事财务工作的员工信息
SELECT * from mayikt_emp WHERE emp_deptno in(SELECT dept_no FROM mayikt_dept WHERE dept_name='财务部门');
-- 6.求每个部门 最低员工薪资
SELECT MIN(emp_salary),emp_deptno FROM mayikt_emp GROUP BY emp_deptno;
-- 7.返回员工薪资大于 平均薪资员工
SELECT * from mayikt_emp WHERE emp_salary>(SELECT AVG(emp_salary) from mayikt_emp);
SELECT AVG(emp_salary) FROM mayikt_emp;
-- JDBC
CREATE TABLE `mayikt_student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `age` tinyint DEFAULT '0',
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
INSERT INTO `mayikt`.`mayikt_student` (`id`, `name`, `age`, `address`) VALUES ('1', 'mayikt', '18', '武汉市');
INSERT INTO `mayikt`.`mayikt_student` (`id`, `name`, `age`, `address`) VALUES ('2', 'meite', '23', '上海市');
INSERT INTO `mayikt`.`mayikt_student` (`id`, `name`, `age`, `address`) VALUES ('3', '李思', '12', '孝感市');
INSERT INTO `mayikt`.`mayikt_student` (`id`, `name`, `age`, `address`) VALUES ('4', '刘流', '27', '武汉市');
INSERT INTO `mayikt`.`mayikt_student` (`id`, `name`, `age`, `address`) VALUES ('5', '王麻子', '12', '孝感市');
INSERT INTO `mayikt`.`mayikt_student` (`id`, `name`, `age`, `address`) VALUES ('6', 'KKK', '11', '成都');
INSERT INTO `mayikt`.`mayikt_student` (`id`, `name`, `age`, `address`) VALUES ('7', 'xiaokey', '22', '武汉市');
INSERT INTO `mayikt`.`mayikt_student` (`id`, `name`, `age`, `address`) VALUES ('8', '999', '33', '孝感市');
INSERT INTO `mayikt`.`mayikt_student` (`id`, `name`, `age`, `address`) VALUES ('9', 'wang', '55', '武汉市');
INSERT INTO `mayikt`.`mayikt_student` (`id`, `name`, `age`, `address`) VALUES ('10', 'lisi', '38', '孝感市');
-- 以下为测试代码
UPDATE mayikt_student set `name`='王麻子',age=38,address='湖北省孝感市' WHERE id=1;