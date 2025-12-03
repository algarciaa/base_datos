select * 
from tienda.cliente;


select c.*
from tienda.cliente c
where c.tipo_identificacion = 'CEDULA';

select c.*
from tienda.cliente c
where c.tipo_identificacion != 'CEDULA';

select c.*
from tienda.cliente c
where c.tipo_identificacion IN ('PASAPORTE', 'RUC');


select tp.*
from tienda.tipo_producto tp;

select p.*
from tienda.producto p;

select tp.id_tipo_producto,
       tp.descripcion as descripcion_tipo_producto,
       p.id_producto,
       p.descripcion as descripcion_producto 
from tienda.tipo_producto tp
     inner join tienda.producto p
     on tp.id_tipo_producto = p.id_tipo_producto;


select pro.id_proveedor,
       pro.nombre as nombre_proveedor,
       tp.id_tipo_producto,
       tp.nombre "nombre_tipo_producto",
       p.id_producto,
       p.nombre nombre_producto
from tienda.producto p
     inner join tienda.tipo_producto tp
     on p.id_tipo_producto = tp.id_tipo_producto
     inner join tienda.proveedor pro
     on p.id_proveedor = pro.id_proveedor;


select f.id_factura,
       df.id_producto,
       p.id_producto,
       p.nombre
from tienda.factura f
     inner join tienda.detalle_factura df 
     on f.id_factura = df.id_factura
     inner join tienda.producto p
     on df.id_producto = p.id_producto 
where f.id_factura = 1;

/*Deber*/

select c.id_cliente,
       c.tipo_identificacion,
       c.identificacion,
       c.nombre,
       c.apellido,
       f.id_factura,
       f.creado_en
from tienda.cliente c
     inner join tienda.factura f
     on c.id_cliente = f.id_cliente 
where c.tipo_identificacion = 'RUC';

select c.id_cliente,
       c.tipo_identificacion,
       c.identificacion,
       c.nombre,
       c.apellido,
       f.id_factura,
       p.nombre "nombre_producto"
from tienda.cliente c
     inner join tienda.factura f
     on c.id_cliente = f.id_cliente
     inner join tienda.detalle_factura df
     on f.id_factura = df.id_factura
     inner join tienda.producto p
     on df.id_producto = p.id_producto 
where c.tipo_identificacion = 'PASAPORTE';



select c.id_cliente,
       c.tipo_identificacion,
       c.identificacion,
       c.nombre,
       c.apellido,
       f.id_factura,
       tp.nombre "nombre_tipo_producto"
from tienda.cliente c
     inner join tienda.factura f
     on c.id_cliente = f.id_cliente
     inner join tienda.detalle_factura df
     on f.id_factura = df.id_factura
     inner join tienda.producto p
     on df.id_producto = p.id_producto 
     inner join tienda.tipo_producto tp
     on p.id_tipo_producto = tp.id_tipo_producto 
where c.tipo_identificacion = 'CEDULA';

/*Clase 27/11/2025*/
--contar las facturas por cliente
select c.id_cliente,
       c.tipo_identificacion,
       c.identificacion,
       c.nombre,
       c.apellido,
       count(f.id_factura) total_factura
from tienda.cliente c
     inner join tienda.factura f
     on c.id_cliente = f.id_cliente 
where c.tipo_identificacion = 'RUC'
group by c.id_cliente,
       c.tipo_identificacion,
       c.identificacion,
       c.nombre,
       c.apellido;

select distinct
       c.id_cliente,
       c.tipo_identificacion,
       c.identificacion,
       c.nombre,
       c.apellido,
       p.nombre "nombre_producto"
from tienda.cliente c
     inner join tienda.factura f
     on c.id_cliente = f.id_cliente
     inner join tienda.detalle_factura df
     on f.id_factura = df.id_factura
     inner join tienda.producto p
     on df.id_producto = p.id_producto 
where c.tipo_identificacion = 'PASAPORTE'
--order by c.id_cliente, p.nombre;
order by 1, 6;

select distinct
       c.id_cliente,
       c.tipo_identificacion,
       c.identificacion,
       c.nombre,
       c.apellido,
       tp.nombre "nombre_tipo_producto"
from tienda.cliente c
     inner join tienda.factura f
     on c.id_cliente = f.id_cliente
     inner join tienda.detalle_factura df
     on f.id_factura = df.id_factura
     inner join tienda.producto p
     on df.id_producto = p.id_producto 
     inner join tienda.tipo_producto tp
     on p.id_tipo_producto = tp.id_tipo_producto 
where c.tipo_identificacion = 'CEDULA';


select distinct p.precio, p.costo
from tienda.producto p
order by p.precio desc, p.costo;

select distinct p.precio
from tienda.producto p
order by p.precio desc;

select distinct p.precio
from tienda.producto p
where p.precio < 30
order by p.precio;


select distinct p.precio
from tienda.producto p
where p.precio >= 30
order by p.precio;

--agregaciones
select sum(f.total) total_facturas
from tienda.factura f;

select count(c.id_cliente) total_clientes
from tienda.cliente c;

select count(f.id_factura ) cantidad_facturas,
       sum(f.total) total_facturas
from tienda.factura f;

select AVG(p.precio) promedio_precio
from tienda.producto p;

select (sum(p.precio) / count(p.id_producto)) promedio_precio
from tienda.producto p;

select max(p.precio) precio_max, 
       min(p.precio) precio_minimo
from tienda.producto p;

select f.estado, count(f.id_factura) cantidad
from tienda.factura f
group by f.estado;

--subconsulta
select c.*
from tienda.cliente c
where c.id_cliente in (select f.id_cliente 
                       from tienda.factura f);
