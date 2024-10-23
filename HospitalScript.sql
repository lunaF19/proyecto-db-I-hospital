/*

•	Médicos, médicos internos, pacientes, habitaciones y otros similares. Bajo esta base de datos, 
	todos tienen sus propias identificaciones específicas vinculadas con los detalles de la conducta. 
	Además, la base de datos de gestión del hospital ofrece varios otros detalles, como habitaciones 
	vacantes, admisiones, deberes del personal, resúmenes de altas, etc. Toda esta información otorga 
	acceso para conocer los detalles necesarios, como el horario de los médicos y las habitaciones vacantes 
	para los pacientes.

•	La base de datos incluye información sobre los pacientes (nombre, edad, género, historial médico, 
	antecedentes familiares, etc.), los médicos (nombre, especialidad, horarios de trabajo, etc.), los 
	departamentos del hospital (unidad de cuidados intensivos, departamento de emergencias, laboratorio, etc.),
	y los suministros médicos (medicamentos, equipo médico, etc.). Además, puedes incluir funcionalidades como la 
	gestión de citas médicas, el seguimiento del historial médico de los pacientes, la gestión de inventarios de 
	suministros médicos, y la programación de procedimientos médicos

•	Sistemas de autorización y autenticación: Es importante que tu base de datos incluya un sistema de 
	autorización y autenticación seguro para que solo los usuarios autorizados puedan acceder a la información 
	del paciente. Esto puede incluir roles de usuario específicos con permisos de acceso restringidos, y un proceso 
	de autenticación seguro, como la autenticación de dos factores.

•	Registro de eventos y auditoría: Tu base de datos debe registrar todos los eventos importantes, como el 
	acceso a la información del paciente o la realización de cambios en los registros médicos. Esto permitirá una 
	auditoría efectiva y ayudará a detectar y prevenir posibles actividades maliciosas.

•	Gestión de la información de facturación: Además de la información médica, tu base de datos también 
	puede incluir información de facturación, como la cobertura de seguros y los pagos realizados. Esto puede 
	ayudar a los pacientes y al personal del hospital a mantener un registro preciso de los costos de los
	tratamientos y los pagos realizados.

•	Soporte multilingüe: El hospital atiende a una población multilingüe, es por eso que debes incluir 
	soporte multilingüe en tu base de datos. Esto puede incluir la capacidad de almacenar y mostrar 
	información en varios idiomas, así como la capacidad de buscar información en diferentes idiomas.

*/

USE AdventureWorks2019;
DROP database Hospital;
CREATE database Hospital;
USE Hospital;

/*
	Tablas Catalogo
*/


/* Catalogo Lenguaje */
CREATE TABLE cat_lenguaje (
	cod_lenguaje CHAR(5) NOT NULL,
	nombre VARCHAR(30)
);

ALTER TABLE cat_lenguaje
ADD CONSTRAINT PK_cat_lenguaje
PRIMARY KEY (cod_lenguaje);

/* Catalogo de Tipos Medicamento */
CREATE TABLE cat_tipos_medicamentos(
	cod_tipo_medicamento CHAR(5) NOT NULL
);

ALTER TABLE cat_tipos_medicamentos
ADD CONSTRAINT PK_cat_tipos_medicamentos
PRIMARY KEY (cod_tipo_medicamento);


CREATE TABLE cat_tipos_medicamentos_lang(
	cod_tipo_medicamento CHAR(5) NOT NULL,
	cod_lenguaje CHAR(5) NOT NULL,
	descripcion VARCHAR(30)
);

ALTER TABLE cat_tipos_medicamentos_lang
ADD CONSTRAINT PK_cat_tipos_medicamentos_lang
PRIMARY KEY (cod_tipo_medicamento, cod_lenguaje), 
CONSTRAINT FK01_cat_tipos_medicamentos_lang__cat_tipos_medicamentos
FOREIGN KEY (cod_tipo_medicamento)
REFERENCES cat_tipos_medicamentos(cod_tipo_medicamento),
CONSTRAINT FK02_cat_tipos_medicamentos_lang__cat_lenguaje
FOREIGN KEY (cod_lenguaje)
REFERENCES cat_lenguaje(cod_lenguaje);


/* Catalogo de Fabricantes Medicamento */
CREATE TABLE cat_fabricantes_medicamentos(
	cod_fabricante_medicamento CHAR(5) NOT NULL,
	descripcion VARCHAR(30)
);

ALTER TABLE cat_fabricantes_medicamentos
ADD CONSTRAINT PK_cat_fabricantes_medicamentos
PRIMARY KEY (cod_fabricante_medicamento);



/* Catalogo de Generos */
CREATE TABLE cat_generos(
	cod_genero CHAR(5) NOT NULL,
	descripcion VARCHAR(30)
);

ALTER TABLE cat_generos
ADD CONSTRAINT PK_cat_generos
PRIMARY KEY (cod_genero);

/* Catalogo de Especialidades */
CREATE TABLE cat_especialidades(
	cod_especialidad CHAR(10) NOT NULL,
	nombre VARCHAR(50),
	descripcion VARCHAR(300)
);

ALTER TABLE cat_especialidades
ADD CONSTRAINT PK_cat_especialidades
PRIMARY KEY (cod_especialidad);

/* Catalogo de Tareas */
CREATE TABLE cat_tareas(
	cod_tarea CHAR(10) NOT NULL
);

ALTER TABLE cat_tareas
ADD CONSTRAINT PK_cat_tareas
PRIMARY KEY (cod_tarea);

/* Catalogo Tareas Traducido */
CREATE TABLE cat_tareas_lang (
	cod_tarea CHAR(10) NOT NULL,
	cod_lenguaje CHAR(5) NOT NULL,
	nombre VARCHAR(50),
	descripcion VARCHAR(300)
);

ALTER TABLE cat_tareas_lang
ADD CONSTRAINT PK_cat_tareas_lang
PRIMARY KEY (cod_tarea, cod_lenguaje), 
CONSTRAINT FK01_cat_tareas_lang__cat_tareas
FOREIGN KEY (cod_tarea)
REFERENCES cat_tareas(cod_tarea),
CONSTRAINT FK01_cat_tareas_lang__cat_lenguaje
FOREIGN KEY (cod_lenguaje)
REFERENCES cat_lenguaje(cod_lenguaje);




/* Catalogo de departamentos que tiene el hospital */
CREATE TABLE cat_departamentos (
	cod_departamento CHAR(10) NOT NULL
)

ALTER TABLE cat_departamentos
ADD CONSTRAINT PK_cat_departamentos
PRIMARY KEY (cod_departamento);



CREATE TABLE cat_departamentos_lang(
	cod_departamento CHAR(10) NOT NULL,
	cod_lenguaje CHAR(5) NOT NULL,
	nombre VARCHAR(50),
	descripcion VARCHAR(300)
);

ALTER TABLE cat_departamentos_lang
ADD CONSTRAINT PK_cat_departamentos_lang
PRIMARY KEY (cod_departamento, cod_lenguaje), 
CONSTRAINT FK01_cat_departamentos_lang__cat_departamentos
FOREIGN KEY (cod_departamento)
REFERENCES cat_departamentos(cod_departamento),
CONSTRAINT FK02_cat_departamentos_lang__cat_lenguaje
FOREIGN KEY (cod_lenguaje)
REFERENCES cat_lenguaje(cod_lenguaje);




/* Catalogo de parentesco paciente */
CREATE TABLE cat_parentesco (
	cod_parentesco CHAR(10) NOT NULL,
	nombre VARCHAR(50),
	descripcion VARCHAR(300)
);

ALTER TABLE cat_parentesco
ADD CONSTRAINT PK_cat_parentesco
PRIMARY KEY (cod_parentesco);



/* Catalogo Roles */
CREATE TABLE cat_roles(
	cod_rol CHAR(5) NOT NULL,
	nombre VARCHAR(30),
	descripcion VARCHAR(300)
);

ALTER TABLE cat_roles
ADD CONSTRAINT PK_cat_roles
PRIMARY KEY (cod_rol);


/* Catalogo Permisos */
CREATE TABLE cat_permisos (
	cod_permiso CHAR(5) NOT NULL,
	nombre VARCHAR(30),
	descripcion VARCHAR(300)
);

ALTER TABLE cat_permisos
ADD CONSTRAINT PK_cat_permisos
PRIMARY KEY (cod_permiso);




/* Catalogo Horarios */
CREATE TABLE cat_horario (
	cod_horario INT NOT NULL,
	descripcion VARCHAR(300)
);

ALTER TABLE cat_horario 
ADD CONSTRAINT PK_cat_horario
PRIMARY KEY (cod_horario);

CREATE TABLE cat_horario_detalle (
	cod_horario INT NOT NULL,
	dia INT NOT NULL, -- DIA 1 - 7
	hora CHAR(4) NOT NULL -- HORA MILITAR  0001 - 2400
);

ALTER TABLE cat_horario_detalle
ADD CONSTRAINT FK01_cat_horario_detalle__cat_horario
FOREIGN KEY (cod_horario)
REFERENCES cat_horario(cod_horario);

 CREATE UNIQUE INDEX UK_horario_detalle  
    ON cat_horario_detalle (cod_horario, dia, hora );  



CREATE TABLE usuarios (
	id INT NOT NULL,
	username VARCHAR(100) NOT NULL,
	correo NVARCHAR(255) NOT NULL,
	contrasenna VARBINARY(64) NOT NULL,
	cedula VARCHAR(15) NOT NULL,
	nombre VARCHAR(100) NOT NULL,
	apellidos VARCHAR(100) NOT NULL,
	edad INT NOT NULL,
	fecha_nacimiento DATE NOT NULL,
	genero CHAR(5) NOT NULL,
	fecha_creado DATETIME NOT NULL,
	fecha_modificado DATETIME NOT NULL
);

ALTER TABLE usuarios
ADD CONSTRAINT PK_usuario
PRIMARY KEY (id),
CONSTRAINT FK02_usuarios__cat_generos
FOREIGN KEY (genero) 
REFERENCES cat_generos(cod_genero)
;

CREATE UNIQUE INDEX UK_usuarios
	ON usuarios(cedula);


CREATE TABLE login_dbfactor(
	id_usuario INT NOT NULL,
	[ip] NVARCHAR(15) NOT NULL, 
	[token] NCHAR(1000) NOT NULL,
	intentos INT NOT NULL DEFAULT 0, --MAXIMO DE INTENTOS 3
	codigo_verificacion NCHAR(10)
);

ALTER TABLE login_dbfactor 
ADD CONSTRAINT FK01_login_dbfactor
FOREIGN KEY (id_usuario)
REFERENCES usuarios(id);



CREATE TABLE roles_usuario (
	id_usuario INT NOT NULL,
	cod_rol CHAR(5) NOT NULL
);


ALTER TABLE roles_usuario
ADD CONSTRAINT PK_roles_usuarios
PRIMARY KEY (id_usuario, cod_rol),
CONSTRAINT FK01_roles_usuarios__usuarios
FOREIGN KEY (id_usuario)
REFERENCES usuarios(id),
CONSTRAINT FK02_roles_usuarios__cat_roles
FOREIGN KEY (cod_rol)
REFERENCES cat_roles(cod_rol)
;

CREATE TABLE permisos_roles(
	cod_rol CHAR(5) NOT NULL,
	cod_permiso CHAR(5) NOT NULL
);

ALTER TABLE permisos_roles 
ADD CONSTRAINT PK_permisos_roles
PRIMARY KEY (cod_rol, cod_permiso),
CONSTRAINT FK01_permisos_roles__cat_roles
FOREIGN KEY (cod_rol)
REFERENCES cat_roles(cod_rol),
CONSTRAINT FK02_permisos_roles__cat_permisos
FOREIGN KEY (cod_permiso)
REFERENCES cat_permisos(cod_permiso)
;


CREATE TABLE horario_doctor(
	id_doctor INT NOT NULL,
	cod_horario INT NOT NULL
);

ALTER TABLE horario_doctor 
ADD CONSTRAINT PK_horario_doctor
PRIMARY KEY (id_doctor),
CONSTRAINT FK01_horario_doctor__usuarios
FOREIGN KEY (id_doctor)
REFERENCES usuarios(id),
CONSTRAINT FK02_horario_doctor__cat_horarios
FOREIGN KEY (cod_horario)
REFERENCES cat_horario(cod_horario);



CREATE TABLE parentesco_usuarios(
	id_usuario INT NOT NULL,
	parentesco CHAR(10) NOT NULL,
	cedula VARCHAR(15) NOT NULL 
);

ALTER TABLE parentesco_usuarios
ADD CONSTRAINT FK01_parentesco_usuarios__usuarios
FOREIGN KEY (id_usuario)
REFERENCES usuarios(id),
CONSTRAINT FK02_parentesco_usuarios__cat_parentesco
FOREIGN KEY (parentesco)
REFERENCES cat_parentesco(cod_parentesco);
;
 
  

CREATE TABLE especialidades_doctor(
	id_doctor INT NOT NULL,
	cod_especialidad CHAR(10) NOT NULL
);

ALTER TABLE especialidades_doctor
ADD CONSTRAINT PK_especialidades_doctor
PRIMARY KEY (id_doctor, cod_especialidad),
/* relaciona el registro con un doctor */
CONSTRAINT FK01_especialidades_doctor___usuarios
FOREIGN KEY (id_doctor)
REFERENCES usuarios(id),

/* relaciona el registro con una especialidad */
CONSTRAINT FK02_especialidades_doctor__cat_especialidades
FOREIGN KEY (cod_especialidad)
REFERENCES cat_especialidades(cod_especialidad);

CREATE TABLE expediente (
	id INT NOT NULL,
	id_usuario INT NOT NULL,
	fecha_creado DATETIME NOT NULL,
	fecha_modificado DATETIME NOT NULL
);

ALTER TABLE expediente
ADD CONSTRAINT PK_expediente
PRIMARY KEY (id),
/*	relaciona el expediente con un paciente 
	mediante el numero de cedula */
CONSTRAINT FK01_expediente__usuarios
FOREIGN KEY (id_usuario)
REFERENCES usuarios(id)
;

CREATE TABLE conducta(
	id INT NOT NULL,
	id_expediente INT NOT NULL,
	detalle VARCHAR(500) NOT NULL,
	fecha_creado DATETIME, 
	fecha_modificado DATETIME
);

ALTER TABLE conducta 
ADD CONSTRAINT PK_conducta
PRIMARY KEY (id),
CONSTRAINT FK01_conducta__expediente
FOREIGN KEY (id_expediente)
REFERENCES expediente(id);



CREATE TABLE historial_medico (
	id INT NOT NULL,
	id_expediente INT NOT NULL,
    condicion VARCHAR(50),
    fecha_diagnostico DATE NOT NULL,
    tratamiento VARCHAR(100),
    fecha_tratamiento_comienza DATE,
    fecha_tratamiento_termina DATE
);

ALTER TABLE historial_medico 
ADD CONSTRAINT PK_historial_medico
PRIMARY KEY (id),
/*	relaciona el historial medico con un expediente
	mediante el id del expediente*/
CONSTRAINT FK01_historial_medico__expediente
FOREIGN KEY (id_expediente)
REFERENCES expediente(id);

 

CREATE TABLE historial_medico_doctor (
	id_historial_medico INT NOT NULL,
	id_doctor INT NOT NULL
);

ALTER TABLE historial_medico_doctor
ADD CONSTRAINT PK_historial_medico_doctor
PRIMARY KEY (id_historial_medico, id_doctor),
/* relaciona el historial medico con varios usuarios con el rol de doctor */
CONSTRAINT FK01_historial_medico_doctor__usuarios
FOREIGN KEY (id_doctor)
REFERENCES usuarios(id),
/* relaciona el registro con un historial medico */
CONSTRAINT FK02_historial_medico_doctor__historial_medico
FOREIGN KEY (id_historial_medico)
REFERENCES historial_medico(id);




CREATE TABLE medicamentos (
    id INT NOT NULL,
	tipo CHAR(5) NOT NULL, 
    fabricante CHAR(5) NOT NULL, 
	stock INT,
    precio DECIMAL(10,2)
);

ALTER TABLE medicamentos
ADD CONSTRAINT PK_medicamentos
PRIMARY KEY (id),
CONSTRAINT FK01_medicamentos_cat_tipos_medicamento
FOREIGN KEY (tipo)
REFERENCES cat_tipos_medicamentos(cod_tipo_medicamento),
CONSTRAINT FK02_medicamentos_cat_fabricantes_medicamentos
FOREIGN KEY (fabricante)
REFERENCES cat_fabricantes_medicamentos(cod_fabricante_medicamento)
;



CREATE TABLE medicamentos_lang(
	id_medicamento INT NOT NULL,
	cod_lenguaje CHAR(5) NOT NULL,
	nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200),
    dosis_recomendada VARCHAR(50)
);

ALTER TABLE medicamentos_lang
ADD CONSTRAINT PK_medicamentos_lang
PRIMARY KEY (id_medicamento, cod_lenguaje), 
CONSTRAINT FK01_medicamentos_lang__medicamentos
FOREIGN KEY (id_medicamento)
REFERENCES medicamentos(id),
CONSTRAINT FK02_medicamentos_lang__cat_lenguaje
FOREIGN KEY (cod_lenguaje)
REFERENCES cat_lenguaje(cod_lenguaje);



CREATE TABLE habitaciones (
  cod_habitacion INT NOT NULL,
  departamento CHAR(10) NOT NULL,
  estado VARCHAR(10)
);

ALTER TABLE habitaciones 
ADD CONSTRAINT PK_habitaciones
PRIMARY KEY (cod_habitacion),
CONSTRAINT FK01_habitaciones__cat_departamentos
FOREIGN KEY (departamento)
REFERENCES cat_departamentos(cod_departamento)
;


CREATE TABLE admisiones (
  id INT NOT NULL,
  id_usuario INT NOT NULL,
  habitacion INT NOT NULL,
  fecha_de_admision DATE,
  fecha_de_alta DATE
);

ALTER TABLE admisiones 
ADD CONSTRAINT PK_admisiones
PRIMARY KEY (id),
CONSTRAINT FK01_admisiones__usuario
FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
CONSTRAINT FK02_admisiones__habitaciones
FOREIGN KEY (habitacion) REFERENCES Habitaciones(cod_habitacion);


CREATE TABLE tareas_roles(
	id INT NOT NULL,
	cod_rol  CHAR(5) NOT NULL,
	cod_tarea CHAR(10) NOT NULL
);

ALTER TABLE tareas_roles
ADD CONSTRAINT PK_tareas_roles
PRIMARY KEY (id),
CONSTRAINT FK01_tareas_roles__cat_roles
FOREIGN KEY (cod_rol)
REFERENCES cat_roles(cod_rol),
CONSTRAINT FK02_tareas_roles__cat_tareas
FOREIGN KEY (cod_tarea)
REFERENCES cat_tareas(cod_tarea) ;
 
CREATE TABLE deberes (
	id INT NOT NULL,
	id_tarea INT NOT NULL,
	id_usuario INT NOT NULL,
	nota VARCHAR(500),
	fecha_asignada DATETIME,
	fecha_finalizada DATETIME
);


ALTER TABLE deberes 
ADD CONSTRAINT PK_deberes
PRIMARY KEY (id),
CONSTRAINT FK01_deberes_usuario
FOREIGN KEY (id_usuario)
REFERENCES usuarios(id),
CONSTRAINT FK02_deberes_deberes
FOREIGN KEY (id_tarea)
REFERENCES tareas_roles(id);


CREATE TABLE recetas (
	id INT NOT NULL,
	id_doctor INT NOT NULL,
	id_paciente INT NOT NULL,
	detalle VARCHAR(200),
	fecha_creacion DATETIME
);

ALTER TABLE recetas
ADD CONSTRAINT PK_recetas
PRIMARY KEY(id),
CONSTRAINT FK01_recetas__doctores
FOREIGN KEY (id_doctor)
REFERENCES usuarios(id),
CONSTRAINT FK02_recetas__pacientes
FOREIGN KEY (id_paciente)
REFERENCES usuarios(id);

CREATE TABLE recetas_detalle (
	id_receta INT NOT NULL,
	num_linea INT NOT NULL,
	id_medicamento INT NOT NULL,
	cantidad INT NOT NULL,
	precio_unitario DECIMAL NOT NULL,
	precio DECIMAL NOT NULL,
	indicacion VARCHAR(200)
);

ALTER TABLE recetas_detalle
ADD CONSTRAINT PK_recetas_detalle
PRIMARY KEY(id_receta,num_linea ),
CONSTRAINT FK01_recetas_detalle__recetas
FOREIGN KEY (id_receta)
REFERENCES recetas(id),
CONSTRAINT FK02_recetas_detalle__medicamentos
FOREIGN KEY (id_medicamento)
REFERENCES medicamentos(id);

CREATE TABLE facturas (
	id	INT NOT NULL,
	id_usuario INT NOT NULL,
	nota VARCHAR(200) NOT NULL,
	fecha DATETIME NOT NULL,
	total DECIMAL NOT NULL,
);

ALTER TABLE facturas
ADD CONSTRAINT PK_factura
PRIMARY KEY(id),
CONSTRAINT FK01_factura_usuario
FOREIGN KEY (id_usuario)
REFERENCES usuarios(id)
;


CREATE TABLE facturas_detalle (
	id_factura	INT NOT NULL,
	num_linea INT NOT NULL,
	detalle VARCHAR(100),
	monto_linea DECIMAL NOT NULL
);

ALTER TABLE facturas_detalle
ADD CONSTRAINT PK_factura_detalle
PRIMARY KEY(id_factura,num_linea),
CONSTRAINT FK01_facturas_detalle__facturas
FOREIGN KEY (id_factura)
REFERENCES facturas(id);



CREATE TABLE admisiones_factura(
	id_factura INT NOT NULL,
	id_admision INT NOT NULL
);

ALTER TABLE admisiones_factura
ADD CONSTRAINT PK_admisiones_factura
PRIMARY KEY(id_factura, id_admision),
CONSTRAINT FK01_admisiones_factura__facturas
FOREIGN KEY (id_factura)
REFERENCES facturas(id),
CONSTRAINT FK02_admisiones_factura__admisiones
FOREIGN KEY (id_admision)
REFERENCES admisiones(id);


CREATE TABLE recetas_factura(
	id_factura INT NOT NULL,
	id_receta INT NOT NULL
);

ALTER TABLE recetas_factura
ADD CONSTRAINT PK_recetas_factura
PRIMARY KEY(id_factura, id_receta),
CONSTRAINT FK01_recetas_factura__facturas
FOREIGN KEY (id_factura)
REFERENCES facturas(id),
CONSTRAINT FK02_recetas_factura__admisiones
FOREIGN KEY (id_receta)
REFERENCES recetas(id);



CREATE TABLE solicitudes_citas(
	id INT NOT NULL,
	id_usuario INT NOT NULL,
	fecha_solicitud DATETIME NOT NULL,
	detalle VARCHAR(300),
	fecha_aprovacion DATETIME,
	id_cita_asignada INT NOT NULL
);

ALTER TABLE solicitudes_citas
ADD CONSTRAINT PK_solicitudes_citas
PRIMARY KEY(id),
CONSTRAINT FK01_solicitudes_citas__usuario
FOREIGN KEY (id_usuario)
REFERENCES usuarios(id);


CREATE TABLE citas(
	id INT NOT NULL,
	id_paciente INT NOT NULL,
	id_doctor INT NOT NULL,
	fecha_cita DATETIME
);

ALTER TABLE citas
ADD CONSTRAINT PK_citas
PRIMARY KEY(id),
CONSTRAINT FK01_citas__doctores
FOREIGN KEY (id_doctor)
REFERENCES usuarios(id),
CONSTRAINT FK02_citas__pacientes
FOREIGN KEY (id_paciente)
REFERENCES usuarios(id);



CREATE TABLE movimientos_auditoria(
	id INT NOT NULL,
	id_usuario INT NOT NULL,
	movimiento VARCHAR (300) NOT NULL,
	tabla VARCHAR(30) NOT NULL,
	fecha_movimiento DATETIME NOT NULL,
	descripcion VARCHAR(4000)
);

ALTER TABLE movimientos_auditoria 
ADD CONSTRAINT PK_movimientos_auditoria
PRIMARY KEY(id),
CONSTRAINT FK01_movimientos_auditoria__usuarios
FOREIGN KEY (id_usuario)
REFERENCES usuarios(id);




/*
	Consultas
*/


/* Data de los Medicamentos */

Select M.id,
	ML.nombre,
	ML.descripcion,
	ML.dosis_recomendada,
	M.tipo, 
	M.fabricante, 
	M.precio,
	M.stock,
	CTML.descripcion
From  medicamentos M
	 Inner Join medicamentos_lang ML
	 On M.id = ML.id_medicamento
	 And Ml.cod_lenguaje = 'ES'
	 Left Join cat_tipos_medicamentos CTM
		Left Join cat_tipos_medicamentos_lang CTML
		On CTML.cod_tipo_medicamento = CTM.cod_tipo_medicamento
		And CTML.cod_lenguaje = 'ES'
	 On M.tipo = CTM.cod_tipo_medicamento
;


Select  
	C.id ,
	C.id_paciente,
	UP.nombre as "Nombre Paciente",
	UD.nombre as "Nombre Doctor",
	C.id_doctor,
	C.fecha_cita
From citas C
	Left Join usuarios UP
	On UP.id = C.id_paciente
	Left Join usuarios UD
	On UD.id = C.id_doctor
;

 
 /* Admisiones Relacionadas Con alguna Factura */
 
Select 
	A.id as id_admision,
	A.id_usuario,
	A.habitacion,
	fecha_de_admision,
	fecha_de_admision
From admisiones_factura AF
	Inner Join admisiones A
	On AF.id_factura = '1' -- Se coloca la factura que se desa consultar
	And A.id = AF.id_admision
;
 
 /* Recetas Relacionadas Con alguna Factura */
 Select 
	R.id as id_admision,
	R.id_doctor,
	R.id_paciente,
	R.detalle,
	R.fecha_creacion
From recetas_factura RF
	Inner Join recetas R
	On RF.id_factura = '1' -- Se coloca la factura que se desa consultar
	And R.id = RF.id_receta;



/* Roles que tiene el usuario */
Select RU.id_usuario,  
		RU.cod_rol,
		CR.nombre,
		CR.descripcion

From roles_usuario RU
	Left Join cat_roles CR
	On CR.cod_rol = RU.cod_rol
	And id_usuario = 1;


/* Permisos del usuario */
Select distinct
	RU.id_usuario,
	CP.cod_permiso,
	CP.nombre,
	CP.descripcion

From roles_usuario RU
	Left Join permisos_roles PR
		Left Join cat_permisos CP
		On CP.cod_permiso = PR.cod_permiso
	On PR.cod_rol = RU.cod_rol

	And RU.id_usuario = 1
;


/*
permisos_roles PR
	Left Join  cat_permisos CP
	On CP.cod_permiso = PR.cod_permiso
*/
select * from cat_generos;
Delete cat_generos;
Insert Into cat_generos(cod_genero, descripcion)
Values ('M', 'masculino'),
('F', 'femenino');
 

Select * From cat_permisos;
Delete cat_permisos;
Insert Into cat_permisos(cod_permiso, nombre, descripcion)
Values ('P1', 'L M', 'Lectura Tabla Medicamentos'),
('P2', 'I M', 'Insertar Tabla Medicamentos'),
('P3', 'U M', 'Actualizar Tabla Medicamentos'),
('P4', 'M M', 'Manipular Tabla Medicamentos')
;


Select * From cat_roles;
Delete cat_roles;
Insert Into cat_roles(cod_rol, nombre, descripcion)
Values ('ROL1', 'L M', 'Lectura Tabla Medicamentos'),
('ROL2', 'I M', 'Insertar Tabla Medicamentos'),
('ROL3', 'U M', 'Actualizar Tabla Medicamentos'),
('ROL4', 'M M', 'Manipular Tabla Medicamentos')
;

Select * From permisos_roles;
Delete permisos_roles;
Insert Into permisos_roles(cod_rol, cod_permiso )
Values ('ROL1', 'P1'), -- ROL1 Puede Leer Medicamentos
('ROL2', 'P1'),-- ROL2 Puede Leer Medicamentos
('ROL2', 'P2'),-- ROL2 Puede Insertar Medicamentos
/* Rol 4 Puede hacer todo*/
('ROL4', 'P1'),
('ROL4', 'P2'),
('ROL4', 'P3'),
('ROL4', 'P4')
;


Select * from usuarios;
Delete usuarios;
Insert Into usuarios(id,username, correo, contrasenna, cedula, nombre, apellidos, edad, fecha_nacimiento, genero, fecha_modificado, fecha_creado)
Values (1, 'lunaF19', 'lunaF19@gmail.com', HASHBYTES('SHA2_512', 'password1234' ), 123456789, 'Freancisco', 'Luna', 20,
SYSDATETIME(), 'M',SYSDATETIME(),SYSDATETIME() );

Select * from roles_usuario;
Delete roles_usuario;
Insert Into roles_usuario(id_usuario, cod_rol)
Values (1,'ROL1' ),
(1,'ROL2' ),
(1,'ROL4' );



Select * From cat_horario;
Delete cat_horario;
Insert Into cat_horario(cod_horario, descripcion)
VALUES (1, 'horario #1'),
(2, 'horario #2');

Select * From  cat_horario_detalle;
Delete cat_horario_detalle;
Insert Into cat_horario_detalle(cod_horario, dia, hora)
Values (1, 1, '0700'),
(1, 1, '1700'), -- Horario 1 Lunes Trabaja de  7am a 5Pm
(1, 2, '0900'),
(1, 2, '1700'), -- Horario 1 Martes Trabaja de  9am a 5Pm
(1, 3, '1200'),
(1, 3, '2100'), -- Horario 1 Miercoles Trabaja de  12md a 9Pm
(2, 1, '0800'),
(2, 1, '1700'), -- Horario 2 Lunes Trabaja de  8am a 5pm
(2, 2, '0500'),
(2, 2, '1200'), -- Horario 2 Martes Trabaja de  9am a 12md
(2, 3, '1200'),
(2, 3, '2100'); -- Horario 2 Miercoles Trabaja de  12md a 9Pm



Select * From cat_lenguaje;
Delete cat_lenguaje;
Insert Into cat_lenguaje(cod_lenguaje, nombre)
Values ('ES', 'Español'),
('EN', 'Ingles');

Select * From cat_tareas;
Delete cat_tareas;
Insert Into cat_tareas(cod_tarea)
Values (1),(2),(3); 


Select * From cat_tareas_lang;
Delete cat_tareas_lang;
Insert Into cat_tareas_lang(cod_tarea, cod_lenguaje, nombre, descripcion)
Values (1, 'ES', 'Tarea #1', 'Para tarea #1 Hacer.....'),
(2,'ES', 'Tarea #2', 'Para tarea #2 Hacer.....'),
(3,'ES', 'Tarea #3', 'Para tarea #3 Hacer.....'); 

Select * From tareas_roles;
Delete tareas_roles;
Insert Into tareas_roles(id,cod_rol, cod_tarea)
Values (1,'ROL1', 1), -- ROL1 Puede hacer tare 1
(2,'ROL1', 2); -- ROL1 Puede hacer tare 2



 
/*
cod_horario INT NOT NULL,
dia INT NOT NULL, -- DIA 1 - 7
hora CHAR(4) NOT NULL -- HORA MILITAR  0001 - 2400
*/



select * from cat_roles
select * from  permisos_roles;


select * from recetas
Select * From admisiones;
Select * From admisiones_factura;
Select * From cat_departamentos;
Select * From cat_departamentos_lang;
Select * From cat_especialidades;
Select * From cat_fabricantes_medicamentos;
Select * From cat_generos;
Select * From cat_horario;
Select * From cat_lenguaje;
Select * From cat_parentesco;
Select * From cat_permisos;
Select * From cat_roles;
Select * From cat_tareas;
Select * From cat_tareas_lang;
Select * From cat_tipos_medicamentos;
Select * From cat_tipos_medicamentos_lang;
Select * From citas;
Select * From conducta;

Select * From deberes;
Select * From especialidades_doctor;
Select * From expediente;

Select * From facturas;
Select * From facturas_detalle;
Select * From habitaciones;
Select * From historial_medico;
Select * From historial_medico_doctor;

Select * From horario_doctor;
Select * From login_dbfactor;

Select * From medicamentos;
Select * From medicamentos_lang;
Select * From movimientos_auditoria;
Select * From parentesco_usuarios;
Select * From permisos_roles;
Select * From recetas;
Select * From recetas_detalle;
Select * From recetas_factura;
Select * From roles_usuario;
Select * From solicitudes_citas;
Select * From tareas_roles;
Select * From usuarios;
