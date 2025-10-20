--creacion de schema
create schema personal;

--creacion de tabla
create table personal.alumnos (
  id serial primary key,
  nombre varchar(100),
  curso varchar(50)
);

--eliminar un tabla y sus datos
drop table personal.alumnos;

--con este query consulto todos los schemas de la base de datos
SELECT *
FROM information_schema.schemata;

--insert de registro a la tabla
insert into personal.alumnos(nombre, curso, edad) 
values('Alex', 'Programacion', 1);

--insertar varios registros
insert into personal.alumnos(nombre, curso)
values
('Ana', 'marketing'),
('Luis', 'matematicas'),
('Maria', 'psicologia');

--insertar elemento con devolucion de id
insert into personal.alumnos(nombre, curso)
values ('Pepito', 'Base de datos')
returning id;
