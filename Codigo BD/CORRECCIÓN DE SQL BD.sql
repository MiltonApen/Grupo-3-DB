/*CORECCION DE ERRORES
 * TABLA DATOS COCHORRO
 * 
 * */
CREATE TABLE datos_cachorro (
id_datos           INTEGER NOT NULL PRIMARY KEY ,
id_cachorro        INTEGER NOT NULL REFERENCES cachorro(id_cachorro),
id_papa            INTEGER NOT NULL REFERENCES papa_cachorro(id_papa),
id_mama            INTEGER NOT NULL REFERENCES mama_cachorro(id_mama),
id_criador         INTEGER NOT NULL REFERENCES criador(id_criador),
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


/*CORRECION TABLA GASTOS
 * TABLA DE GATOS
 **/

CREATE TABLE gastos (
 id_gastos               INTEGER NOT NULL PRIMARY KEY ,
 id_cachorro             INTEGER NOT NULL REFERENCES cachorro(id_cachorro),
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

/* CORRECCION DE TABLA VENTAS
 * TABLA DE VENTAS
 * */

CREATE TABLE venta (
id_venta        INTEGER NOT NULL PRIMARY KEY ,
id_cachorro     INTEGER NOT NULL REFERENCES cachorro(id_cachorro),
id_cliente      INTEGER NOT NULL REFERENCES cliente(id_cliente), 
tipo_pago       VARCHAR (15) NOT NULL ,
precio_vendido  INTEGER NOT NULL
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

/*CORRECCION DE TABLA CLIENTE
 * TABLA DE CLIENTE
 * */

CREATE TABLE cliente (
id_cliente      INTEGER NOT NULL PRIMARY KEY ,
nit             INTEGER NOT NULL,
nombre          VARCHAR2   (15 CHAR) NOT NULL,
direccion       VARCHAR2(20 CHAR) NOT NULL,
telefono        INTEGER NOT NULL
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


























































