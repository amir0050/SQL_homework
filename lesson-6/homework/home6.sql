SELECT DISTINCT 
    CASE WHEN col1 < col2 THEN col1 ELSE col2 END AS col1,
    CASE WHEN col1 < col2 THEN col2 ELSE col1 END AS col2
FROM InputTbl;


SELECT *
FROM TestMultipleZero
WHERE 
    CASE 
        WHEN ISNULL(A, 0) = 0 AND ISNULL(B, 0) = 0 AND ISNULL(C, 0) = 0 AND ISNULL(D, 0) = 0
        THEN 0 ELSE 1
    END = 1;



SELECT *
FROM section1
WHERE id % 2 = 1;


SELECT TOP 1 *
FROM section1
ORDER BY id ASC;

SELECT TOP 1 *
FROM section1
ORDER BY id DESC;


SELECT *
FROM section1
WHERE LOWER(name) LIKE 'b%';



SELECT *
FROM ProductCodes
WHERE Code LIKE '%[_]%';
