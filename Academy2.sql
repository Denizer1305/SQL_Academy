SELECT Teachers.Surname, Groups1.NameG
FROM Academy.Teachers, Academy.Groups1;

SELECT Faculties.NameF
FROM Academy.Faculties
WHERE EXISTS (
    SELECT Departments.NameF
    FROM Academy.Departments
    WHERE Departments.Financing > Faculties.Financing
);

SELECT Teachers.Surname, Groups1.NameG
FROM Teachers
JOIN Groups1 ON Teachers.id = Groups1.id;

SELECT Teachers.NameT, Teachers.Surname
FROM Teachers
JOIN Groups1 on Teachers.id = Groups1.id
WHERE Groups1.NameG = 'Группа-1';

SELECT Teachers.NameT, Teachers.Surname, Faculties.NameF
FROM Teachers
JOIN Faculties on Teachers.id = Faculties.id;

SELECT Departments.NameF, Groups1.NameG
FROM Departments
JOIN Groups1 ON Departments.id = Groups1.DepartmentId;

SELECT Subjects.NameSub
FROM Teachers
JOIN Lectures ON Teachers.id = Lectures.TeacherId
JOIN Subjects ON Subjects.id = Lectures.SubjectId
WHERE Teachers.NameT = 'Иван' AND Teachers.Surname = 'Иванов';

SELECT Groups1.NameG
FROM Groups1
JOIN Departments ON Groups1.DepartmentId = Departments.id
WHERE Departments.NameF = 'Информационные технологии';

SELECT Groups1.NameG AS GroupName, Departments.NameF AS DepartmentName
FROM Groups1
JOIN Departments ON Groups1.DepartmentId = Departments.id
WHERE Groups1.Years = 5;

SELECT Teachers.NameT AS ProfessorName, Teachers.Surname AS ProfessorSurname,  Lectures.LectureRoom AS LectureName
FROM Teachers
JOIN Lectures ON Teachers.id = Lectures.TeacherId
WHERE Lectures.LectureRoom = 'Лекция 2';


