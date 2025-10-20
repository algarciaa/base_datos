create table personal.clientes(
  id_cliente serial primary key,
  nombre varchar(100),
  correo varchar(100)
);

create table personal.pedidos(
  id_pedido serial primary key,
  fecha date,
  total decimal(10,2),
  id_cliente int
);

alter table if exists personal.pedidos drop constraint if exists fk_pedidos_clientes;

alter table personal.pedidos
add constraint fk_pedidos_clientes
foreign key (id_cliente)
references personal.clientes(id_cliente);

--opcion 1, si existe relacion elimino la tabla que tiene la relacion
drop table personal.pedidos;
drop table personal.clientes;

--opcion 2, para poder eliminar la tabla que tiene la relacion uso el cascade
drop table personal.clientes cascade;
drop table personal.pedidos;

