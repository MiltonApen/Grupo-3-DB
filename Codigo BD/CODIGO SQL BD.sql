
/*----------------------------------------------------------------------------------
 * */

/*Creacion de BD
 * */
CREATE USER prototipo 
IDENTIFIED BY prototipo;

GRANT create session TO prototipo;
GRANT create table TO prototipo;
GRANT create view TO prototipo;
GRANT create any trigger TO prototipo;
GRANT create any procedure TO prototipo;
GRANT create sequence TO prototipo;
GRANT create synonym TO prototipo;

/*
 * Creacion de espacio en disco duro para almacenar la data de la base de datos
 * */


CREATE TABLESPACE tbs2 
   DATAFILE 'bts2_data.dbf' 
   SIZE 1m;
  
ALTER DATABASE 
DATAFILE 'C:\ORACLEXE\APP\ORACLE\PRODUCT\11.2.0\SERVER\DATABASE\BTS2_DATA.DBF' 
RESIZE 3000M;
  
GRANT UNLIMITED TABLESPACE TO prototipo;

/*TABLA CACHARRO
 * */


CREATE TABLE cachorro (
id_cachorro INTEGER NOT NULL PRIMARY KEY ,
 no_microchip    INTEGER NOT NULL UNIQUE,
 no_tatuaje      INTEGER  NOT NULL,
 nombre          VARCHAR2(15 CHAR) NOT NULL,
 fecha_nacimiento  DATE NOT NULL,
 raza            VARCHAR2(15 CHAR) NOT NULL,
 sexo            VARCHAR2(10 CHAR) NOT NULL
) TABLESPACE "TBS2";

/*
 * Creacion de Trigger para auto incremento de ID en tablas, oracle no maneja aunto incremento
 * */

CREATE SEQUENCE prototipo.id_cachorro INCREMENT BY 1 MINVALUE 1 NOCYCLE NOCACHE NOORDER ;

CREATE TRIGGER id_cachorro
BEFORE INSERT ON cachorro
FOR EACH ROW
BEGIN
  SELECT id_cachorro.nextval
  INTO :new.id_cachorro
  FROM dual;
END;

/*
 * TABLA PAPA DEL CACHORRO
 * */

CREATE TABLE papa_cachorro (
id_papa          INTEGER NOT NULL PRIMARY KEY ,
 nombre          VARCHAR2(15 CHAR) NOT NULL,
 raza            VARCHAR2(15 CHAR) NOT NULL,
 sexo            VARCHAR2(10 CHAR) NOT NULL,
 fecha_nacimiento  DATE NOT NULL
) TABLESPACE "TBS2";

CREATE SEQUENCE prototipo.id_papa INCREMENT BY 1 MINVALUE 1 NOCYCLE NOCACHE NOORDER ;

CREATE TRIGGER id_papa
BEFORE INSERT ON papa_cachorro
FOR EACH ROW
BEGIN
  SELECT id_papa.nextval
  INTO :new.id_papa
  FROM dual;
END;


/* TABLA MAMA DEL CACHORRO
 * */
CREATE TABLE mama_cachorro (
id_mama          INTEGER NOT NULL PRIMARY KEY ,
 nombre          VARCHAR2(15 CHAR) NOT NULL,
 raza            VARCHAR2(15 CHAR) NOT NULL,
 sexo            VARCHAR2(10 CHAR) NOT NULL,
 fecha_nacimiento  DATE NOT NULL
) TABLESPACE "TBS2";

CREATE SEQUENCE prototipo.id_mama INCREMENT BY 1 MINVALUE 1 NOCYCLE NOCACHE NOORDER ;

CREATE TRIGGER id_mama
BEFORE INSERT ON mama_cachorro
FOR EACH ROW
BEGIN
  SELECT id_mama.nextval
  INTO :new.id_mama
  FROM dual;
END;


/* TABLA CRIADOR DEL CACHORRO
 * */
CREATE TABLE criador (
id_criador      INTEGER NOT NULL PRIMARY KEY ,
 nombre         VARCHAR2   (15 CHAR) NOT NULL,
 dpi            INTEGER    NOT NULL,
 direccion      VARCHAR2(20 CHAR) NOT NULL,
 telefono       INTEGER NOT NULL
) TABLESPACE "TBS2";

CREATE SEQUENCE prototipo.id_criador INCREMENT BY 1 MINVALUE 1 NOCYCLE NOCACHE NOORDER ;

CREATE TRIGGER id_criador
BEFORE INSERT ON criador
FOR EACH ROW
BEGIN
  SELECT id_criador.nextval
  INTO :new.id_criador
  FROM dual;
END;

/*TABLA DE CLIENTE
 * */

CREATE TABLE cliente (
id_cliente      INTEGER NOT NULL PRIMARY KEY ,
 nombre         VARCHAR2   (15 CHAR) NOT NULL,
 direccion      VARCHAR2(20 CHAR) NOT NULL,
 telefono       INTEGER NOT NULL
) TABLESPACE "TBS2";

CREATE SEQUENCE prototipo.id_cliente INCREMENT BY 1 MINVALUE 1 NOCYCLE NOCACHE NOORDER ;

CREATE TRIGGER id_cliente
BEFORE INSERT ON cliente
FOR EACH ROW
BEGIN
  SELECT id_cliente.nextval
  INTO :new.id_cliente
  FROM dual;
END;


/*TABLA DE VENTAS
 * */

CREATE TABLE venta (
id_venta      INTEGER NOT NULL PRIMARY KEY ,
id_cachorro  INTEGER NOT NULL REFERENCES cachorro(id_cachorro),
tipo_pago  VARCHAR (15) NOT NULL ,
precio_vendido INTEGER NOT NULL
) TABLESPACE "TBS2";

CREATE SEQUENCE prototipo.id_venta INCREMENT BY 1 MINVALUE 1 NOCYCLE NOCACHE NOORDER ;

CREATE TRIGGER id_venta
BEFORE INSERT ON venta
FOR EACH ROW
BEGIN
  SELECT id_venta.nextval
  INTO :new.id_venta
  FROM dual;
END;


/*TABLA DE GATOS
 **/

CREATE TABLE gastos (
 id_gastos               INTEGER NOT NULL PRIMARY KEY ,
 perros_desparacitado    INTEGER NOT NULL ,
 perrro_vacunados        INTEGER  NOT NULL ,
 medicina_general        INTEGER  NOT NULL ,
 alimentacion            INTEGER  NOT NULL ,
 mano_obra               INTEGER  NOT NULL , 
 producto_limpieza       INTEGER  NOT NULL
) TABLESPACE "TBS2";

CREATE SEQUENCE prototipo.id_gastos INCREMENT BY 1 MINVALUE 1 NOCYCLE NOCACHE NOORDER ;

CREATE TRIGGER id_gastos
BEFORE INSERT ON gastos
FOR EACH ROW
BEGIN
  SELECT id_gastos.nextval
  INTO :new.id_gastos
  FROM dual;
END;

/*TABLA PARTO
 * */
CREATE TABLE parto (
id_parto                INTEGER NOT NULL PRIMARY KEY ,
id_mama                  INTEGER NOT NULL REFERENCES mama_cachorro(id_mama),
cantidad_cachorros       INTEGER NOT NULL,
tipo_partos             VARCHAR (20) NOT NULL ,
fecha                   DATE NOT NULL,
vacunas                 VARCHAR (15) NOT NULL ,
desparcitacitada        VARCHAR (15) NOT NULL ,
medicina_recetada       VARCHAR (15) NOT NULL ,  
primer_vacuna           DATE NOT NULL ,
primer_desparacitacion  DATE NOT NULL 
) TABLESPACE "TBS2";


CREATE SEQUENCE prototipo.id_parto INCREMENT BY 1 MINVALUE 1 NOCYCLE NOCACHE NOORDER ;

CREATE TRIGGER id_parto
BEFORE INSERT ON parto
FOR EACH ROW
BEGIN
  SELECT id_parto.nextval
  INTO :new.id_parto
  FROM dual;
END;

/*TABLA DE VETERNARIO
 * */

CREATE TABLE veterinario (
id_veterinario   INTEGER  NOT NULL PRIMARY KEY ,
 nombre         VARCHAR2 (15 CHAR) NOT NULL,
 no_colegiado   INTEGER  NOT NULL,
 direccion      VARCHAR2 (20 CHAR) NOT NULL,
 telefono       INTEGER NOT NULL
) TABLESPACE "TBS2";

CREATE SEQUENCE prototipo.id_veterinario INCREMENT BY 1 MINVALUE 1 NOCYCLE NOCACHE NOORDER ;

CREATE TRIGGER id_veterinario
BEFORE INSERT ON veterinario
FOR EACH ROW
BEGIN
  SELECT id_veterinario.nextval
  INTO :new.id_veterinario
  FROM dual;
END;

/*TABLA GESTACION
 * */
CREATE TABLE gestacion (
id_gestaciion          INTEGER NOT NULL PRIMARY KEY ,
id_mama                INTEGER NOT NULL REFERENCES mama_cachorro(id_mama),
tiempo_gestacion   VARCHAR (10) NOT NULL ,
primer_celo  DATE NOT NULL ,
primer_cruce DATE NOT NULL ,
seguno_cruce DATE NOT NULL ,
tercer_cruce DATE NOT NULL ,
fecha_gestacion DATE NOT NULL
) TABLESPACE "TBS2";

CREATE SEQUENCE prototipo.id_gestacion INCREMENT BY 1 MINVALUE 1 NOCYCLE NOCACHE NOORDER ;

CREATE TRIGGER id_gestacion
BEFORE INSERT ON gestacion
FOR EACH ROW
BEGIN
  SELECT id_gestacion.nextval
  INTO :new.id_gestacion
  FROM dual;
END;

/*TABLA CONTROL CAMADA
 * */

CREATE TABLE control_camada (
id_camada          INTEGER NOT NULL PRIMARY KEY ,
id_mama            INTEGER NOT NULL REFERENCES mama_cachorro(id_mama),
id_papa            INTEGER NOT NULL REFERENCES papa_cachorro(id_papa),
id_cachorro        INTEGER NOT NULL REFERENCES cachorro(id_cachorro),
id_parto           INTEGER NOT NULL REFERENCES parto(id_parto)
) TABLESPACE "TBS2";

CREATE SEQUENCE prototipo.id_camada INCREMENT BY 1 MINVALUE 1 NOCYCLE NOCACHE NOORDER ;

CREATE TRIGGER id_camada
BEFORE INSERT ON control_camada
FOR EACH ROW
BEGIN
  SELECT id_camada.nextval
  INTO :new.id_camada
  FROM dual;
END;

/*TABLA CITA VETERNARIA
 * */

CREATE TABLE cita_veterinaria (
id_veterinaria      INTEGER NOT NULL PRIMARY KEY ,
id_camada          INTEGER NOT NULL REFERENCES control_camada(id_camada),
id_veterinario      INTEGER NOT NULL REFERENCES veterinario(id_veterinario)
) TABLESPACE "TBS2";

CREATE SEQUENCE prototipo.id_veterinaria INCREMENT BY 1 MINVALUE 1 NOCYCLE NOCACHE NOORDER ;

CREATE TRIGGER id_veterinaria
BEFORE INSERT ON cita_veterinaria
FOR EACH ROW
BEGIN
  SELECT id_veterinaria.nextval
  INTO :new.id_veterinaria
  FROM dual;
END;

/*TABLA USUARIO
 * */

CREATE TABLE usuario_login(
id_usuario        VARCHAR (30) PRIMARY KEY,
nombre_usuario   VARCHAR (15) NOT NULL, 
contraseña        VARCHAR (30) NOT NULL
) TABLESPACE "TBS2";

CREATE SEQUENCE prototipo.id_usuario INCREMENT BY 1 MINVALUE 1 NOCYCLE NOCACHE NOORDER ;

CREATE TRIGGER id_usuario
BEFORE INSERT ON usuario_login
FOR EACH ROW
BEGIN
  SELECT id_usuario.nextval
  INTO :new.id_usuario
  FROM dual;
END;

/*TABLA DATOS COCHORRO
 * */
CREATE TABLE datos_cachorro (
id_datos           INTEGER NOT NULL PRIMARY KEY ,
id_cachorro        INTEGER NOT NULL REFERENCES cachorro(id_cachorro),
id_papa            INTEGER NOT NULL REFERENCES papa_cachorro(id_papa),
id_mama            INTEGER NOT NULL REFERENCES mama_cachorro(id_mama),
id_criador         INTEGER NOT NULL REFERENCES criador(id_criador),
id_cliente         INTEGER NOT NULL REFERENCES cliente(id_cliente),
id_gastos          INTEGER NOT NULL REFERENCES gastos(id_gastos),
id_venta           INTEGER NOT NULL REFERENCES venta(id_venta),
id_veterinaria      INTEGER NOT NULL REFERENCES cita_veterinaria(id_veterinaria)
) TABLESPACE "TBS2";

CREATE SEQUENCE prototipo.id_datos INCREMENT BY 1 MINVALUE 1 NOCYCLE NOCACHE NOORDER ;

CREATE TRIGGER id_datos
BEFORE INSERT ON datos_cachorro
FOR EACH ROW
BEGIN
  SELECT id_datos.nextval
  INTO :new.id_datos
  FROM dual;
END;


/*TABLA RESGISTRO USUARIOS
 * */

CREATE TABLE registro_usuarios (
id_registro     INTEGER  NOT NULL PRIMARY KEY ,
 nombre         VARCHAR2 (15 CHAR) NOT NULL,
 email          VARCHAR (20)  NOT NULL,
 contraseña     VARCHAR2 (20 CHAR) NOT NULL,
 confirmar_contraseña VARCHAR (15) NOT NULL
) TABLESPACE "TBS2";


CREATE SEQUENCE prototipo.id_registro INCREMENT BY 1 MINVALUE 1 NOCYCLE NOCACHE NOORDER ;

CREATE TRIGGER id_registro
BEFORE INSERT ON registro_usuarios
FOR EACH ROW
BEGIN
  SELECT id_registro.nextval
  INTO :new.id_registro
  FROM dual;
END;

/*----------------------------------------------------------------------------------
 * */





















































