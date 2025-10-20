create table personal.alumno (
  id serial primary key,
  nombre varchar(100),
  cursor varchar(50)
);

--alter a un campo de la tabla
alter table personal.alumno
rename column cursor to curso;

--adicionar una columna a la tabla
alter table personal.alumno
add column edad varchar(10);

--cambiar tipo de dato a columna
alter table personal.alumno
alter column edad type integer using edad::integer;

--eliminar una columna de la tabla
alter table personal.alumno
drop column edad;

--cambiar nombre de la tabla
alter table personal.alumno
rename to alumnos;

--para poner restrincciones
alter table personal.alumnos
add column edad integer;

alter table personal.alumnos
alter column edad set not null;

alter table personal.alumnos
alter column edad drop not null;
