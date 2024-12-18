CREATE TABLE PERSONA (
    DNI VARCHAR2 (8),
    NOMBRE VARCHAR2 (30),
    APELLIDO1 VARCHAR2 (30),
    APELLIDO2 VARCHAR2 (30) NULL,
    TIPO VARCHAR2 (30),
    PRIMARY KEY pk_dni (DNI)
);
CREATE TABLE BIBLIOTECARIO (
    DNIBIBLIOTECARIO VARCHAR2 (8),
    PRIMARY KEY pk_bibliotecario (DNIBIBLIOTECARIO),
    FOREIGN KEY pf_bibliotecario (DNI) REFERENCES PERSONA(DNI)
);
CREATE TABLE SOCIO (
    DNISOCIO VARCHAR2 (8),
    PRIMARY KEY pk_socio (DNISOCIO),
    FOREIGN KEY pf_socio (DNI) REFERENCES PERSONA(DNI)
);
CREATE TABLE AUTOR (
    DNIAUTOR VARCHAR2 (8),
    PRIMARY KEY pk_autor (DNIAUTOR),
    FOREIGN KEY pf_autor (DNI) REFERENCES PERSONA(DNI)
);
CREATE TABLE TEMATICA (
    TEMATICA VARCHAR2 (30),
    PRIMARY KEY pk_tematica (TEMATICA)
);
CREATE TABLE LIBRO (
    ISBN NUMBER (8),
    TITULO VARCHAR2 (30),
    NUMPAGINAS NUMBER (3),
    PRIMARY KEY pk_libro (ISBN),
    FOREIGN KEY pk_libro (TEMATICA) REFERENCES TEMATICA (TEMATICA)
);
CREATE TABLE LIBROAUTOR (
    ISBN NUMBER (8),
    DNIAUTOR VARCHAR2 (8),
    PRIMARY KEY pk_libroautor (ISBN, DNIAUTOR),
    FOREIGN KEY fk_libroautor (ISBN) REFERENCES LIBRO (ISBN),
    FOREIGN KEY fk_libroautor2 (DNIAUTOR) REFERENCES AUTOR (DNIAUTOR)
);
CREATE TABLE PRESTAMO (
    DNIBIBLIOTECARIO VARCHAR2 (8),
    DNISOCIO VARCHAR2 (8),
    ISBN NUMBER (8),
    PRIMARY KEY pk_prestamo (DNIBIBLIOTECARIO, DNISOCIO, ISBN),
    FOREIGN KEY fk_prestamo (DNIBIBLIOTECARIO) REFERENCES BIBLIOTECARIO (DNIBIBLIOTECARIO),
    FOREIGN KEY fk_prestamo2 (DNISOCIO) REFERENCES SOCIO (DNISOCIO),
    FOREIGN KEY fk_prestamo3 (ISBN) REFERENCES LIBRO (ISBN),
);