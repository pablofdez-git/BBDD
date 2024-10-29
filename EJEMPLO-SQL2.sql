CREATE TABLE ASIGNATURA(
    CODASIG NUMBER(3),
    NOMBRE VARCHAR2(30),
    NUMHORAS NUMBER(3),
    CONSTRAINT pk_asignatura PRIMARY KEY (CODASIG)
);

CREATE TABLE ALUMNO(
    DNI VARCHAR2(3) NOT NULL,
    NOMBRE VARCHAR2(30) NOT NULL,
    APELLIDO1 VARCHAR2(50) NOT NULL,
    APELLIDO2 VARCHAR2 (50) NULL,
    CONSTRAINT pk_alumno PRIMARY KEY(DNI)
);

--TABLA DE RELACIONES

CREATE TABLE INSCRIPCION(
    CODASIG NUMBER(3),
    DNI VARCHAR2(3),
    CALIFICACION NUMBER(2),
    FECHA DATE, 
    CONSTRAINT pk_inscripcion PRIMARY KEY(CODASIG,DNI, FECHA),
    CONSTRAINT fk_asignatura FOREIGN KEY(CODASIG) REFERENCES ASIGNATURA(CODASIG),
    CONSTRAINT fk_alumno FOREIGN KEY(DNI) REFERENCES ALUMNO(DNI)
);

